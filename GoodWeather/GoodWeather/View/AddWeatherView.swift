//
//  AddWeatherView.swift
//  GoodWeather
//
//  Created by Yiğit Güleç on 9.07.2021.
//


import UIKit

class AddWeatherView: UIView {

    var textField: UITextField!
    var saveButton: UIButton!
    var leftBarButton: UIBarButtonItem!
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubviews() {
        backgroundColor = .white
        
        textField = buildTextField()
        saveButton = buildSaveButton()
        leftBarButton = buildLeftBarButton()
        stackView = buildStackView()
        
        addSubview(stackView)
        stackView.addSubview(textField)
        stackView.addSubview(saveButton)
        
        setConstraints()
    }
    
    func buildTextField() -> UITextField {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300.00, height: 30.00))
        textField.placeholder = "Enter City Name"
        // below part adds padding to text inside text field
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        textField.borderStyle = .roundedRect
        return textField
    }
    
    func buildSaveButton() -> UIButton {
        let saveButton = UIButton(type: .roundedRect)
        saveButton.layer.cornerRadius = 5
        saveButton.addTarget(AddWeatherViewController(), action: #selector(AddWeatherViewController().savePressed), for: .touchUpInside)
        saveButton.setTitle("Save", for: .normal)
        return saveButton
    }
    
    func buildLeftBarButton() -> UIBarButtonItem {
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: AddWeatherViewController(), action: #selector(AddWeatherViewController().closePressed))
        AddWeatherViewController().navigationController?.navigationItem.leftBarButtonItem = leftBarButton
        return leftBarButton
    }
    
    func buildStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }
    
    func setConstraints() {
        textField.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
        textField.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0).isActive = true
        textField.leadingAnchor.constraint(equalTo: textField.leadingAnchor, constant: 0).isActive = true
        textField.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 0).isActive = true
        textField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 0).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: 0).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: saveButton.trailingAnchor, constant: 0).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.centerYAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:0).isActive = true
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:0).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
        stackView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 0).isActive = true
                stackView.heightAnchor.constraint(equalToConstant:150).isActive = true
    }
    
}
