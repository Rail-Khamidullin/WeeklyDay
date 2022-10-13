//
//  ViewController.swift
//  training2
//
//  Created by Раиль on 03.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //  Текстовое поле для ввода числа
    @IBOutlet weak var dateTF: UITextField!
    
    //  Тестовое поле для ввода месяца
    @IBOutlet weak var mounthTF: UITextField!
    
    //  Текстовое поле для ввода года
    @IBOutlet weak var yearTF: UITextField!
    
    //  Окно для показа дня недели
    @IBOutlet weak var resultLable: UILabel!
    
    //  Кнопка поиска дня недели
    @IBAction func buttonPresed(_ sender: UIButton) {
        
        //      Проверяем на nil
        guard let day = dateTF.text, let mounth = mounthTF.text, let year = yearTF.text else {return}
        
        //      Создаём текущий календарь, на основании которого будет поиск дня недели
        let calendar = Calendar.current
        //      Класс датаКомпонент будет собирать данные дня, месяца и года
        var dateComponents = DateComponents()
        //      Присваиваем в датаКомпонент число дня, месяца и года, преобразовав из Стринг в Инт
        dateComponents.day = Int(day)
        
        dateComponents.month = Int(mounth)
        
        dateComponents.year = Int(year)
        
        //      Необходимо отформатировать выводящую дату на экран
        let dateFormatter = DateFormatter()
        
        //      Перевод с английского на русский язык формат выводящего текста дней недели
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        //      Дни недели будут выводиться в нужном формате (параметр ЕЕЕЕ указан в Шоу куик хелп )
        dateFormatter.dateFormat = "EEEE"
        
        //      Присваиваем в дату календарь с нашими компонентами даты: день, месяц, год
        guard let date = calendar.date(from: dateComponents) else {return}
        
        //      Форматируем дату с компоенентами
        let weekDay = dateFormatter.string(from: date)
        
        //      Текст начинается с большой буквы
        let capitalized = weekDay.capitalized
        
        //      Присвоили лаблу результат поиска дня недели
        resultLable.text = capitalized
    }
    //  Метод позволяет свернуть клавиатуру после завершения ввода или нажатия на свободное пространство View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

