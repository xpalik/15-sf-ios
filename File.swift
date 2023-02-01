
// 1. Создайте перечисление для ошибок. Добавьте в него 3 кейса:
//
// ошибка 400,
// ошибка 404,
// ошибка 500.
// Далее создайте переменную, которая будет хранить в себе какую-либо ошибку (400 или 404 или 500). И при помощи do-catch сделайте обработку ошибок перечисления. Для каждой ошибки должно быть выведено сообщение в консоль.

enum ErrorList: Error {
    case e400
    case e404
    case e500
}

var ErrorCode = ErrorList.e500

do {
    if ((ErrorCode == ErrorList.e400) || (ErrorCode == ErrorList.e404) || (ErrorCode == ErrorList.e500)) {
        throw ErrorCode
    }
}
catch ErrorList.e400 {
    print("Ошибка 400")
}
catch ErrorList.e404 {
    print("Ошибка 404")
}
catch ErrorList.e500 {
    print("Ошибка 500")
}

//2. Теперь добавьте проверку переменных в генерирующую функцию и обрабатывайте её!

func someTrowingFunc() throws {
    if ((ErrorCode == ErrorList.e400) || (ErrorCode == ErrorList.e404) || (ErrorCode == ErrorList.e500)) {
        throw ErrorCode
    }
}

do {
    try someTrowingFunc()

} catch ErrorList.e400 {
    print("Ошибка 400")
} catch ErrorList.e404 {
    print("Ошибка 404")
} catch ErrorList.e500 {
    print("Ошибка 500")
}

//3. Напишите функцию, которая будет принимать на вход два разных типа и проверять: если типы входных значений одинаковые, то вывести сообщение “Yes”, в противном случае — “No”.

func compareType<T, U>(a: T, b: U) {
    (type(of: a) == type(of: b)) ? print("3: Yes") : print("3: No")
}

compareType(a:1, b:1)
compareType(a:"abc", b:1)
compareType(a: false, b: true)

//4. Реализуйте то же самое, но если тип входных значений различается, выбросите исключение. Если тип одинаковый — тоже выбросите исключение, но оно уже будет говорить о том, что типы одинаковые. Не бойтесь этого. Ошибки — это не всегда про плохой результат.
enum typeOfErrors: Error {
    case wrongType
    case unequatable
}
func compareTypeWThrow<T, U>(a: T, b: U) throws {
    if (type(of: a) == type(of: b)) {
        print("4: Yes")
    } else {
        throw typeOfErrors.wrongType
    }
}

do {
    try compareTypeWThrow(a:1, b:"abc")
} catch typeOfErrors.wrongType {
    print("4: No")
}

//5. Напишите функцию, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства ==.

func compareValues<T: Equatable>(a: T, b: T) -> Bool {
    if a == b {
            return true
        } else {
            return false
        }
    
}
print(compareValues(a:4, b:5))
print(compareValues(a:"abc", b:"abc"))

