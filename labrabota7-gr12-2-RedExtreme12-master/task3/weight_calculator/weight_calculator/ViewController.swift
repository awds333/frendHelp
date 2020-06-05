import UIKit

let ageLabel = UILabel()
let heightLabel = UILabel()
let weightLabel = UILabel()
let sexLabel = UILabel()
let countOfWorkoutsLabel = UILabel()

let ageTextField = UITextField()
let heightTextField = UITextField()
let weightTextField = UITextField()

let sexSegmentedControl = UISegmentedControl()
let countOfWorkoutsSegmentedControl = UISegmentedControl()

let resultLabel = UILabel()

let calculateButton = UIButton()
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        hideKeyboardWhenTappedAround()
        
        createLabel(label: ageLabel, ourString: "Возраст", numOfLines: 1, topAnchor: self.view.topAnchor)
        createLabel(label: heightLabel, ourString: "Рост", numOfLines: 1, topAnchor: ageLabel.topAnchor)
        createLabel(label: weightLabel, ourString: "Вес", numOfLines: 1, topAnchor: heightLabel.topAnchor)
        createLabel(label: sexLabel, ourString: "Пол", numOfLines: 1, topAnchor: weightLabel.topAnchor)
        createLabel(label: countOfWorkoutsLabel, ourString: "Тренировок в неделю", numOfLines: 2, topAnchor: sexLabel.topAnchor)
        
        
        let centeredParagraphStyle = NSMutableParagraphStyle()
               centeredParagraphStyle.alignment = .center
               
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .regular), .paragraphStyle: centeredParagraphStyle]
        
        ageTextField.textAlignment = .center
        ageTextField.attributedPlaceholder = NSAttributedString(string: "Прим: 27", attributes:attributes)
        ageTextField.backgroundColor = .white
        ageTextField.layer.cornerRadius = 5
        ageTextField.layer.masksToBounds = true
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageTextField)
        ageTextField.topAnchor.constraint(equalTo: ageLabel.topAnchor, constant: 15).isActive = true
        ageTextField.leftAnchor.constraint(equalTo: ageLabel.rightAnchor, constant: 25).isActive = true
        ageTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        heightTextField.textAlignment = .center
        heightTextField.attributedPlaceholder = NSAttributedString(string: "Прим: 182", attributes:attributes)
        heightTextField.backgroundColor = .white
        heightTextField.layer.cornerRadius = 5
        heightTextField.layer.masksToBounds = true
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heightTextField)
        heightTextField.topAnchor.constraint(equalTo: heightLabel.topAnchor, constant: 15).isActive = true
        heightTextField.leftAnchor.constraint(equalTo: heightLabel.rightAnchor, constant: 25).isActive = true
        heightTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        weightTextField.textAlignment = .center
        weightTextField.attributedPlaceholder = NSAttributedString(string: "Прим: 75", attributes:attributes)
        weightTextField.backgroundColor = .white
        weightTextField.layer.cornerRadius = 5
        weightTextField.layer.masksToBounds = true
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(weightTextField)
        weightTextField.topAnchor.constraint(equalTo: weightLabel.topAnchor, constant: 15).isActive = true
        weightTextField.leftAnchor.constraint(equalTo: weightLabel.rightAnchor, constant: 25).isActive = true
        weightTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        sexSegmentedControl.backgroundColor = .lightGray
        sexSegmentedControl.insertSegment(withTitle: "Мужчина", at: 0, animated: true)
        sexSegmentedControl.insertSegment(withTitle: "Женщина", at: 1, animated: true)
        sexSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sexSegmentedControl)
        sexSegmentedControl.topAnchor.constraint(equalTo: sexLabel.topAnchor, constant: 10).isActive = true
        sexSegmentedControl.leftAnchor.constraint(equalTo: sexLabel.rightAnchor, constant: 25).isActive = true
        
        countOfWorkoutsSegmentedControl.backgroundColor = .lightGray
        countOfWorkoutsSegmentedControl.insertSegment(withTitle: "0", at: 0, animated: true)
        countOfWorkoutsSegmentedControl.insertSegment(withTitle: "1-3", at: 1, animated: true)
        countOfWorkoutsSegmentedControl.insertSegment(withTitle: "3-5", at: 2, animated: true)
        countOfWorkoutsSegmentedControl.insertSegment(withTitle: "6-7", at: 3, animated: true)
        countOfWorkoutsSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countOfWorkoutsSegmentedControl)
        countOfWorkoutsSegmentedControl.topAnchor.constraint(equalTo: countOfWorkoutsLabel.topAnchor, constant: 10).isActive = true
        countOfWorkoutsSegmentedControl.leftAnchor.constraint(equalTo: countOfWorkoutsLabel.rightAnchor, constant: 25).isActive = true
        
        calculateButton.setTitle("Рассчитать", for: .normal)
        calculateButton.backgroundColor = .blue
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.layer.cornerRadius = 23
        calculateButton.addTarget(self, action: #selector(calculateResult), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.topAnchor.constraint(equalTo: countOfWorkoutsLabel.topAnchor, constant: 73).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
      
        resultLabel.numberOfLines = 4
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.textAlignment = .center
        
        view.addSubview(resultLabel)
        resultLabel.topAnchor.constraint(equalTo: calculateButton.topAnchor, constant: 50).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
       
    }

    func createLabel(label: UILabel, ourString: String, numOfLines: Int, topAnchor: NSLayoutYAxisAnchor) {
        self.view.addSubview(label)
        label.text = ourString
        label.numberOfLines = numOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 25).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func calculateResult() {
        var BMR = Double()
        var AMR = Double()
        var result = Double()
        guard let age = Double(ageTextField.text ?? "0") else { return }
        guard let height = Double(heightTextField.text ?? "0") else { return }
        let ourHeightInM = height * 0.01
        guard let weight = Double(weightTextField.text ?? "0") else { return }
        if sexSegmentedControl.selectedSegmentIndex == 0 {
            BMR = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
        }
        else {
            BMR = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
        }
        
        if countOfWorkoutsSegmentedControl.selectedSegmentIndex == 0 {
            AMR = 1.2
        } else if countOfWorkoutsSegmentedControl.selectedSegmentIndex == 1 {
            AMR = 1.375
        } else if countOfWorkoutsSegmentedControl.selectedSegmentIndex == 2 {
            AMR = 1.55
        } else {
            AMR = 1.725
        }
        
        result = BMR * AMR
        
        print(height)
        print(weight)
        print(age)
        print(BMR)
        print(AMR)
        resultLabel.text = ("Вы должны потреблять \(Int(result)) килокалорий для поддержания веса. Индекс массы тела \(Int(weight/(ourHeightInM*ourHeightInM))).")
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

