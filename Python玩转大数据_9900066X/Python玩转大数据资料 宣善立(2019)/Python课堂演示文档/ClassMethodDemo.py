# ClassMethod Demo
class Root:
    __total = 0

    def __init__(self, v):  # 构造方法
        self.__value = v
        Root.__total += 1

    def show(self):  # 普通实例方法
        print('self.__value:', self.__value)
        print('Root.__total:', Root.__total)

    @classmethod  # 修饰器，声明类方法
    def classShowTotal(cls):  # 类方法
        print(cls.__total)

    @staticmethod  # 修饰器，声明静态方法
    def staticShowTotal():  # 静态方法
        print(Root.__total)


# end of class Root
r = Root(3)
Root.classShowTotal()  # 通过类名调用类方法
Root.staticShowTotal()  # 通过类名调用静态方法
r.classShowTotal()  # 通过对象来调用类方法
r.staticShowTotal()  # 通过对象来调用静态方法
r.show()
r = Root(5)


