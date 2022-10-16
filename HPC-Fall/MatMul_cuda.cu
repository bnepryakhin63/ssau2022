#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>
#include <cmath>
#include <time.h>

using namespace std;

class Matrix
{
private:
	int razmer_matric;
	double** matrica;
public:
	Matrix(int razmer)
	{
		razmer_matric = razmer;
		matrica = new double* [razmer];
		for (int i = 0; i < razmer; i++) {
			matrica[i] = new double[razmer];
		}
	}
	void free_memory();
	void random_values();
	int get_size();
	void set_value(int line, int column, double value);
	double get_value(int line, int column);
	Matrix transposition();
	void write_matrix();
};

void Matrix::free_memory()
{
	delete[] matrica;
}

void Matrix::random_values()
{
	int razmer = razmer_matric;
	for (int i = 0; i < razmer; i++) {
		for (int j = 0; j < razmer; j++) {
			matrica[i][j] = 2 * ((double)rand() / (double)RAND_MAX) - 1;
		}
	}
}

int Matrix::get_size()
{
	return razmer_matric;
}

void Matrix::set_value(int line, int column, double value)
{
	matrica[line][column] = value;
}

double Matrix::get_value(int line, int column)
{
	return matrica[line][column];
}

Matrix Matrix::transposition()
{
	int razmer = razmer_matric;
	Matrix At(razmer);

	for (int i = 0; i < razmer; i++) {
		for (int j = 0; j < razmer; j++) {
			At.set_value(i, j, matrica[j][i]);
		}
	}
	return At;
}

void Matrix::write_matrix()
{
	int razmer = razmer_matric;
	for (int i = 0; i < razmer; i++) {
		cout << "| ";
		for (int j = 0; j < razmer; j++) {
			cout << matrica[i][j] << " ";
		}
		cout << "|" << endl;
	}
	cout << endl;
}

Matrix multiplication(Matrix A, Matrix B)
{
	int razmer = A.get_size();
	double sum;
	Matrix C(razmer);

	for (int k = 0; k < razmer; k++) {
		for (int l = 0; l < razmer; l++) {
			sum = 0;
			for (int m = 0; m < razmer; m++) {
				sum = sum + A.get_value(k, m) * B.get_value(m, l);
			}
			C.set_value(k, l, sum);
		}
	}

	return C;
}

void copy_values(Matrix matrica1, double matrica2[])
{
	int razmer = matrica1.get_size();
	for (int i = 0; i < razmer * razmer; i++) {
		matrica2[i] = matrica1.get_value(i / razmer, i % razmer);
	}
}

__global__ void deviceTransposition(double* matrica1, double* matrica2, int* razmer)
{
	unsigned long long int i = threadIdx.x + blockIdx.x * blockDim.x;
	unsigned long long int siatka = blockDim.x * gridDim.x;
	for (i; i < razmer[0] * razmer[0]; i += siatka) {
		matrica2[i] = matrica1[(i % razmer[0]) * razmer[0] + i / razmer[0]];
	}
}

__global__ void deviceMultiplication(double* matrica1, double* matrica2, double* matrica3, int* razmer)
{
	unsigned long long int i = threadIdx.x + blockIdx.x * blockDim.x;
	unsigned long long int j = threadIdx.y + blockIdx.y * blockDim.y;
	unsigned long long int siatkax = blockDim.x * gridDim.x;
	unsigned long long int siatkay = blockDim.y * gridDim.y;
	double sum;
	for (i; i < razmer[0] * razmer[0]; i += siatkax) {
		sum = 0;
		for (j; j < razmer[0]; j += siatkay) {
			sum = sum + matrica1[((i / razmer[0]) * razmer[0]) + j] * matrica2[i % razmer[0] + j * razmer[0]];
		}
		matrica3[i] = sum;
	}
}

__global__ void deviceAddition(double* matrica1, double* matrica2, double* matrica3, int* razmer)
{
	unsigned long long int i = threadIdx.x + blockIdx.x * blockDim.x;
	unsigned long long int siatka = blockDim.x * gridDim.x;
	for (i; i < razmer[0] * razmer[0]; i += siatka) {
		matrica3[i] = matrica2[i] + matrica1[i];
	}
}

int main()
{
	srand(time(NULL));
	while (true) {
		int razmer[1];
		cout << "Zadajte razmer matricy: ";
		cin >> razmer[0];

		Matrix A(razmer[0]);
		Matrix B(razmer[0]);
		Matrix C(razmer[0]);

		A.random_values();
		B.random_values();

		/*cout << "Matrica A:" << endl;
		A.write_matrix();
		cout << "Matrica B:" << endl;
		B.write_matrix();*/

		clock_t start;
		double duration_on_CPU;
		start = clock();

		C = multiplication(A, B);
		/*cout << "Matrica C na CPU:" << endl;
		C.write_matrix();*/

		duration_on_CPU = 1000 * (clock() - start) / CLOCKS_PER_SEC;

		cout << "Dlya umnozheniya matric A*B na CPU potrebovalos': " << duration_on_CPU << " ms." << endl;

		double duration_on_CPU1;
		start = clock();

		double* A1 = new double[razmer[0] * razmer[0]];
		double* B1 = new double[razmer[0] * razmer[0]];
		double* C1 = new double[razmer[0] * razmer[0]];

		copy_values(A, A1);
		copy_values(B, B1);

		double* dev_A;
		double* dev_At;
		double* dev_B;
		double* dev_Bt;
		double* dev_C;
		double* dev_Ct;
		double* dev_res;
		double* dev_res1;
		int* dev_razmer;

		int razmerBloka = 1024;
		int liczbaBlokow = (razmer[0] * razmer[0] + razmerBloka - 1) / razmerBloka;
		int sization = razmer[0] * razmer[0] * sizeof(double);

		cudaMalloc((void**)&dev_razmer, sizeof(int));
		cudaMalloc((void**)&dev_A, sization);
		cudaMalloc((void**)&dev_At, sization);
		cudaMalloc((void**)&dev_B, sization);
		cudaMalloc((void**)&dev_Bt, sization);
		cudaMalloc((void**)&dev_C, sization);
		cudaMalloc((void**)&dev_Ct, sization);
		cudaMalloc((void**)&dev_res, sization);
		cudaMalloc((void**)&dev_res1, sization);

		cudaMemcpy(dev_A, A1, sization, cudaMemcpyHostToDevice);
		cudaMemcpy(dev_B, B1, sization, cudaMemcpyHostToDevice);
		cudaMemcpy(dev_razmer, razmer, sizeof(int), cudaMemcpyHostToDevice);
		clock_t start2;
		double duration_on_GPU;
		start2 = clock();

		deviceMultiplication<<<liczbaBlokow, razmerBloka>>>(dev_A, dev_B, dev_C, dev_razmer);
		cudaDeviceSynchronize();

		duration_on_GPU = 1000 * (clock() - start2) / CLOCKS_PER_SEC;
		cudaMemcpy(C1, dev_C, sization, cudaMemcpyDeviceToHost);
		cout << "Dlya umnozheniya matric A*B na GPU potrebovalos': " << duration_on_GPU << " ms." << endl;

		/*cout << "matrica C na GPU:" << endl;
		for (int i = 0; i < razmer[0] * razmer[0]; i++) {
			if (i % razmer[0] == 0) cout << endl;
			cout << C1[i] << " | ";
		}
		cout << endl;*/

		double duration_on_GPU1;
		start2 = clock();

		deviceTransposition<<<liczbaBlokow, razmerBloka>>>(dev_A, dev_At, dev_razmer);
		cudaDeviceSynchronize();
		deviceTransposition<<<liczbaBlokow, razmerBloka>>>(dev_B, dev_Bt, dev_razmer);
		cudaDeviceSynchronize();
		deviceMultiplication<<<liczbaBlokow, razmerBloka>>>(dev_B, dev_Bt, dev_res, dev_razmer);
		cudaDeviceSynchronize();
		deviceTransposition<<<liczbaBlokow, razmerBloka>>>(dev_C, dev_Ct, dev_razmer);
		cudaDeviceSynchronize();
		deviceMultiplication<<<liczbaBlokow, razmerBloka>>>(dev_C, dev_Ct, dev_res1, dev_razmer);
		cudaDeviceSynchronize();

	
		cout << "Poslednij element matricy C: " << C1[razmer[0] * razmer[0] - 1] << endl;
		cout << endl;
		double stosunek;
		if (duration_on_GPU != 0) {
			stosunek = duration_on_CPU / duration_on_GPU;
			cout << "Pervyj raschet na GPU v " << stosunek << " raza bystree." << endl;
		}
		else {
			cout << "Pervyj raz na GPU raven nulyu, nevozmozhno vychislit' sootnoshenie" << endl;
		}
		if (duration_on_GPU1 != 0) {
			stosunek = duration_on_CPU1 / duration_on_GPU1;
			cout << "Vtoroj raschet na GPU v " << stosunek << " raza bystree." << endl;
		}
		else {
			cout << "Vtoroj raz na GPU raven nulyu, nevozmozhno vychislit' sootnoshenie" << endl;
		}
		cout << endl;

		double max = 0;
		for (int i = 0; i < razmer[0] * razmer[0]; i++) {
			if (abs(C.get_value(i / razmer[0], i % razmer[0]) - C1[i]) > max) max = abs(C.get_value(i / razmer[0], i % razmer[0]) - C1[i]);
		}
		if (max == 0) cout << "Net nikakoj raznicy mezhdu znazheniymi C s CPU i GPU" << endl;
		else cout << "V meste naibol'shego raskhozhdeniya znazheniya C otlichayutsya na " << max << endl;


		A.free_memory();
		B.free_memory();
		C.free_memory();
		cudaFree(dev_razmer);
		cudaFree(dev_A);
		cudaFree(dev_B);
		cudaFree(dev_C);
		cudaFree(dev_res);
		delete[] A1;
		delete[] B1;
		delete[] C1;
	}
	return 0;
}