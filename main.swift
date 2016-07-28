
import UIKit

class main{

  //run terminal command
  func runTerminalCommand(launchPath:String, args: String...) -> Int32 {
      let task = NSTask()
      task.launchPath = launchPath
      task.arguments = args       
      task.currentDirectoryPath = self.readFromProjectInfoFile("xcodeprojectdir") //ex. User/username/Desktop/Xcodeproject/
      task.launch()
      task.waitUntilExit()
      return task.terminationStatus
    }//func ends here
    
  //get current time as string. html report will be generated based on current time
  func getCurrentTimeStamp() -> String{
        
      let date = NSDate()
      let formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy-MM-dd-HH:mm:ss"
      //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 6)
      formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
      return formatter.stringFromDate(date)
      
    }//func ends here
}

let run = main()

var currentTime = run.getCurrentTimeStamp()
run.runTerminalCommand("/bin/bash", args: "runXcodeBuild.sh",".xcodeprojectLocation","schemeName","desiredLocationToSaveTestReort","\(currentTime)")


