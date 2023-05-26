# Лабораторная работа № 2:
# Тема: "Моделирование алгоритма Chord" 
---

## Основные технологии:

* __Язык__: Python 3.9

## Описание основных модулей программы

*  *main.py* - модуль для запуска выполнения всего кода;
*  *Finger.py* - модуль, который хранит в себе класс Finger (информация об узлах).  
*  *ChardNode.py* - модуль, который который хранит в себе массива объектов класса.  


## Пример работы:

Реализация функции:
a. Поиск по идентификатору
```python
    def find_successor(self, node_id: int):
        """Поиск successor по id."""
        node = self.find_predecessor(node_id)
        return node.get_successor()

    def find_predecessor(self, node_id: int):
        """Поиск predecessor по id."""
        node = self
        while not (self.__id_in_interval(node_id, node.id, node.get_successor().id)
                   or node_id == node.get_successor().id):
            node = node.closest_preceding_finger(node_id)
        return node
```
b. Добавление узла
![Добавление узла](https://github.com/bnepryakhin63/ssau2022/blob/main/Designing_Distributed_Applications/Lab2/img/add1.png)

![Добавление узла](https://github.com/bnepryakhin63/ssau2022/blob/main/Designing_Distributed_Applications/Lab2/img/add2.png)

c. Удаление узла
![Удаление узла](https://github.com/bnepryakhin63/ssau2022/blob/main/Designing_Distributed_Applications/Lab2/img/del.png)

d. Стабилизация системы (доп.)
```python
   def stabilize(self) -> None:
        """Стабилизация системы."""
        x = self.get_successor().get_predecessor()
        if self.__id_in_interval(x.id, self.id, self.get_successor().id):
            self.set_successor(x)
        self.get_successor().notify(self)
```