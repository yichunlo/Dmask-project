//
//  Mask.swift
//  Dmask_replace
//
//  Created by 羅義鈞 on 2020/10/10.
//

import SwiftUI

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.custom("Avenir Next", size: 60))
                .fontWeight(.black)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
    
}

struct ProgressTrack: View {
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().stroke(Color.blue.opacity(0.7), lineWidth: 15)
        )
    }
}


struct ProgressBar: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 250, height: 250)
            .overlay(
                Circle().trim(from:0, to: progress())
                    .stroke(
                        style: StrokeStyle(
                            lineWidth: 15,
                            lineCap: .round,
                            lineJoin:.round
                        )
                    )
                    .foregroundColor(
                        (completed() ? Color.green : Color.orange)
                ).animation(
                    .easeInOut(duration: 0.2)
                )
        )
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct CountdownView: View {
    @State var counter: Int = 0
    var countTo: Int = 360
    
    var body: some View {
        VStack{
            ZStack{
                ProgressTrack()
                ProgressBar(counter: counter, countTo: countTo)
                Clock(counter: counter, countTo: countTo)
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
}


struct Mask: View {
   // @State private var timeRemaining = 360
    var body: some View {
        VStack {
            HStack{
                Text("Mask").font(.largeTitle).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(30)
            }
            //Ellipse 1
            /*
            ZStack {
                Circle().fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 0.2800000011920929)))
                .frame(width: 300, height: 300)
                Circle().fill(Color(#colorLiteral(red: 0.24149304628372192, green: 0.7356247901916504, blue: 0.8916666507720947, alpha: 1)))
                .frame(width: 270, height: 270)
                /*Text("Time: \(timeRemaining)").font(.title).foregroundColor(Color.orange).bold()
            }.offset(y: 30).onReceive(timer){
                time in if self.timeRemaining > 0{
                    self.timeRemaining -= 1
                }*/
            }*/
            CountdownView()
                //It is recommended to repla...
            Text("It is recommended to replace your mask  every 4 hours at most. You could press the renew button whenever you replace your mask, which will reset the clock.").font(.custom("Roboto Bold", size: 15)).offset(y: 20).padding(50)
            Button(action: {}){
                Text("Renew").bold().frame(width: 100, height: 50).foregroundColor(.white).background(Color.orange)
            }.offset(x: -110, y: -20)
            Spacer()
        }
        
    }
}

struct Mask_Previews: PreviewProvider {
    static var previews: some View {
        Mask()
    }
}
