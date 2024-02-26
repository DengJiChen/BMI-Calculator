//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Lab1422 on 2024/2/26.
//

import SwiftUI
struct ContentView: View {
    @State private var selectedGenderIndex = 0;
    @State private var height = 0.0;
    @State private var weight = 0.0;
    @State private var BMIvalue = 0.0;
    @State private var weightStatus = "Unknown";
    
    
    var body: some View {
        HStack {
            Spacer()
            Text("BMI Calculator")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Spacer()
        }.padding().background(Color(red:0.95, green: 0.95, blue:0.95))
        
        VStack(alignment: .leading){
            HStack {
                Text("Height(cm):").padding()
                TextField("height", value: $height, format: .number)
                    .padding()
                    .frame(width: 100.0, height: 40.0)
                    .background(Color(red:0.95, green: 0.95, blue:0.95))
                    .cornerRadius(9.0)
            }
            HStack {
                Text("Weight(kg):").padding()
                TextField("weight", value: $weight, format: .number)
                    .padding()
                    .frame(width: 100.0, height: 40.0)
                    .background(Color(red:0.95, green: 0.95, blue:0.95))
                    .cornerRadius(9.0)
                Spacer()
            }
            HStack {
                Picker(selection: $selectedGenderIndex, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                    Text("Male").tag(0)
                    Text("Female").tag(1)
                }.pickerStyle(.segmented).padding()
                Spacer()
                Button("Calculate" ,action: BMICalculate).padding()
            }
        }
        
        HStack {
            Spacer()
            Text("Result")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            Spacer()
        }.padding().background(Color(red:0.95, green: 0.95, blue:0.95))
        
        VStack(alignment: .leading){
            HStack{
                Text("Your BMI:").padding()
                Text(String(format: "%.3f", BMIvalue))
                Spacer()
            }
            HStack {
                Text("Weight Status:").padding()
                Text(weightStatus)
                Spacer()
            }
        }
        Spacer()
    }
    
    func BMICalculate() {
        let heightInMeters = Double(height) / 100.0
        BMIvalue = Double(weight) / (heightInMeters * heightInMeters)
        
        if BMIvalue > 24.9 && selectedGenderIndex == 1{
            weightStatus = "it's a secret."
            
            }else if BMIvalue < 18.5 {
                weightStatus = "Underweight"
                
            } else if BMIvalue < 24.9 {
                weightStatus = "Healthy weight"
                
            } else if BMIvalue < 29.9 {
                weightStatus = "Overweight"
                
            } else {
                weightStatus = "Obesity"
            }
    }
}

#Preview {
    ContentView()
}
