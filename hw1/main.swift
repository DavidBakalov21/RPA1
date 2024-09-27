
import Foundation
print("*****************************")
print("*****************************")
print("Task1!")
print("*****************************")
print("*****************************")
//source https://www.geeksforgeeks.org/gnome-sort-a-stupid-one/
func Gnome(intArray: [Int?])->[Int] {
    var filtered=intArray.compactMap{$0}
    let size = filtered.count
    var index: Int = 0
    while(index<size){
        if(index==0 || filtered[index]>=filtered[index-1]){
            index+=1
        }else{
            let temp:Int = filtered[index-1]
            filtered[index-1]=filtered[index]
            filtered[index]=temp
            index-=1
        }
    }
    return filtered
}

var testRandInt:[Int]=[]
for _ in 0...9999{
    testRandInt.append(Int.random(in: 0...99999))
}
let testData = [35, 12, 43, 8, 51, 27, 19, 3, 47, 30]
print(Gnome(intArray: testData))
var gnomeStart=DispatchTime.now()
let gnom=Gnome(intArray: testRandInt)
var gnomeEnd=DispatchTime.now()
print("Gnome time:")
var gnomeTime = gnomeEnd.uptimeNanoseconds-gnomeStart.uptimeNanoseconds
print(gnomeTime)

print("normal sort")
var normaStart = DispatchTime.now()
let normal=testRandInt.sorted()
var normalEnd = DispatchTime.now()
var normalTime = normalEnd.uptimeNanoseconds-normaStart.uptimeNanoseconds
print("normal time:")
print(normalTime)


print("Difference:")
print(gnomeTime - normalTime)
// Swift's sorted() is for sure faster, but it is not really critical

print("*****************************")
print("*****************************")
print("Task2")
print("*****************************")
print("*****************************")


let JsonStudents="""

{
  "students": [
    {
      "id": 1,
      "name": "Alice",
      "age": 20,
      "subjects": ["Math", "Physics"],
      "address": {
        "street": "123 Main St",
        "city": "New York",
        "postalCode": "10001"
      },
      "scores": {
        "Math": 95,
        "Physics": 88,
        "Chemistry": null
      },
      "hasScholarship": true,
      "graduationYear": 2024
    },
    {
      "id": 2,
      "name": "Bob",
      "age": 22,
      "subjects": ["Literature", "History"],
      "address": {
        "street": "456 Elm St",
        "city": "San Francisco",
        "postalCode": null
      },
      "scores": {
        "Literature": 85,
        "History": 90,
        "Philosophy": 80
      },
      "hasScholarship": false,
      "graduationYear": 2023
    },
    {
      "id": 3,
      "name": "Charlie",
      "age": null,
      "subjects": null,
      "address": null,
      "scores": null,
      "hasScholarship": null,
      "graduationYear": null
    },
    {
      "id": 4,
      "name": "Diana",
      "age": 21,
      "subjects": ["Biology", "Chemistry"],
      "address": {
        "street": "789 Oak St",
        "city": "Chicago",
        "postalCode": "60616"
      },
      "scores": {
        "Biology": 92,
        "Chemistry": 85
      },
      "hasScholarship": true,
      "graduationYear": null
    },
    {
      "id": 5,
      "name": "Eve",
      "age": 23,
      "subjects": ["Math", "Computer Science"],
      "address": {
        "street": "101 Maple Ave",
        "city": "Los Angeles",
        "postalCode": "90001"
      },
      "scores": {
        "Math": 78,
        "Computer Science": 91
      },
      "hasScholarship": false,
      "graduationYear": 2022
    },
    {
      "id": 6,
      "name": "Frank",
      "age": 19,
      "subjects": ["Physics", "Chemistry"],
      "address": {
        "street": "202 Pine St",
        "city": "Boston",
        "postalCode": "02101"
      },
      "scores": {
        "Physics": 89,
        "Chemistry": 84
      },
      "hasScholarship": false,
      "graduationYear": 2025
    },
    {
      "id": 7,
      "name": "Grace",
      "age": 20,
      "subjects": ["History", "Philosophy"],
      "address": {
        "street": "303 Birch Rd",
        "city": "Seattle",
        "postalCode": "98101"
      },
      "scores": {
        "History": 92,
        "Philosophy": 85
      },
      "hasScholarship": true,
      "graduationYear": 2024
    },
    {
      "id": 8,
      "name": "Henry",
      "age": 21,
      "subjects": ["Math", "Computer Science"],
      "address": {
        "street": "404 Cedar Blvd",
        "city": "Miami",
        "postalCode": "33101"
      },
      "scores": {
        "Math": 90,
        "Computer Science": 93
      },
      "hasScholarship": true,
      "graduationYear": 2024
    },
    {
      "id": 9,
      "name": "Isabel",
      "age": 22,
      "subjects": ["Biology", "Chemistry"],
      "address": {
        "street": "505 Oak St",
        "city": "Houston",
        "postalCode": "77001"
      },
      "scores": {
        "Biology": 94,
        "Chemistry": 87
      },
      "hasScholarship": false,
      "graduationYear": 2023
    },
    {
      "id": 10,
      "name": "Jack",
      "age": 19,
      "subjects": ["Literature", "History"],
      "address": {
        "street": "606 Spruce Dr",
        "city": "Denver",
        "postalCode": "80201"
      },
      "scores": {
        "Literature": 88,
        "History": 91
      },
      "hasScholarship": true,
      "graduationYear": 2025
    }
  ]
}
"""

class StudentParser {
    var JsonData:String
    struct Student: Codable{
        var id: Int?
        var name: String?
        var age: Int?
        var subjects: [String?]?
        var address: [String: String?]?
        var scores: [String: Int?]?
        var hasScholarship:Bool?
        var graduationYear:Int?
        
        var getId: Int{
            return id ?? 0
        }
        var getName: String{
            return name ?? "unknown"
        }
        var getAge: Int{
            return age ?? -1
        }
        var getSubjects: [String] {
            return subjects?.compactMap { $0 } ?? [""]
        }
        var getAdress: [String: String]{
            return address?.mapValues{$0 ?? ""} ?? ["":""]
        }
        var getScores: [String: Int]{
            return scores?.mapValues{$0 ?? 0} ?? ["":0]
        }
        var getHasScholarship:Bool{
            return hasScholarship ?? false
        }
        
        var getGraduationYear:Int{
            return graduationYear ?? -1
        }
    }
    struct JSONStruct: Codable {
        let students: [Student]
    }
    func setJsonData(data:String){
        JsonData=data
    }
    init(JsonData: String) {
        self.JsonData = JsonData
    }
    
    func parseJson()-> [Student]?{
        let data = JsonData.data(using: .utf8)!
        do {
            let students = try JSONDecoder().decode(JSONStruct.self, from: data)
            let finalRes = students.students
            return finalRes
        } catch {
            return nil
        }
    }
    func printStudent(student:Student){
        print("Id: \(student.getId)")
        print("Name: \(student.getName)")
        print("Age: \(student.getAge)")
        
        print("Subjects: \(student.getSubjects)")
        print("Address: \(student.getAdress)")
        print("Scores: \(student.getScores)")
        
        print("Scholarship: \(student.getHasScholarship)")
        print("Graduation year: \(student.getGraduationYear)")
        print("-------------------------------------")
    }
    func showJson(){
        let studentArray = parseJson()
        guard let safeArray=studentArray else {
            print("Bad data")
            return
        }
        for student in safeArray{
           printStudent(student: student)
        }
    }
    func getOldest(){
        let studentArray = parseJson()
        guard let safeArray=studentArray else {
            print("Bad data")
            return
        }
        //https://stackoverflow.com/questions/24130026/how-to-sort-an-array-of-custom-objects-by-property-value
        let sortedStudent=safeArray.sorted{$0.getAge > $1.getAge}
        printStudent(student: sortedStudent[0])
    }
}

let parser=StudentParser(JsonData: JsonStudents)
parser.showJson()
print("Oldest:")
parser.getOldest()


print("*****************************")
print("*****************************")
print("Task3")
print("*****************************")
print("*****************************")
class Node{
    var children:[Node]
    var value:Int
    
    func addNode(child:Node){
        children.append(child)
    }
    
    func findDepth()->Int{
        if (children.count==0){
            return 1
        }else{
            let deph = children.compactMap{$0.findDepth()}
            return deph.max()!+1
        }
    }
    
    func DFS(searchValue:Int)->Node?{
        if value==searchValue{
            return self
        }
        //Lil note: since we have a tree(not a simple graph) we can't have have loops, so we don't need an array of already visited nodes
        for child in children {
           let res = child.DFS(searchValue: searchValue)
            if (res?.value==searchValue){
                return res
            }
        }
        return nil
    }
    
    init(value: Int) {
        self.children = []
        self.value = value
    }
}


let firstEl=Node(value: 10)
let secondEl=Node(value: 30)
firstEl.addNode(child: secondEl)
firstEl.addNode(child: Node(value: 2))
secondEl.addNode(child: Node(value: 90))
print(firstEl.findDepth())

print(firstEl.DFS(searchValue: 90)!.value)

print("*****************************")
print("*****************************")
print("Task 4")
print("*****************************")
print("*****************************")
var array:[Any] = [3,"8",0.4]
extension Array {

    subscript(safe index: Int) -> Element {
        var indexClone:Int=index
        if (indexClone < 0){
           //IDK
            indexClone=self.count-1
        }
        if (indexClone >= self.count){
            indexClone = indexClone % self.count
        }
        return self[indexClone]
    }
        
}
for i in 0...10{
    print(array[safe: i])
}

//Reverse
print("Reverse")
print(array[safe: -1])


//Sources:
//https://www.avanderlee.com/swift/computed-property/
//https://www.avanderlee.com/swift/json-parsing-decoding/
//Geeks for geeks to remind trees
//https://www.kirupa.com/javascript/infinitely_cycle_through_array.htm - infinite loop formula
