class Student{
  String studentName = 'Isaac';
  int studentAge = 10;
  String studentCourse = 'Business';
  String studentId = '1005345';
  bool isNSS = false;
  String studentEmail = 'nkansah@gmail.com';
  String studentLevel = '200';

  set setStudentName(String name){
    studentName = name;
  }

  set setStudentCourse(String course){
    studentCourse = course;
  }

  set setStudentAge(int age){
    studentAge = age;
  }

  set setStudentId(String id){
    studentId = id;
  }

  set setIsNSS(bool nssStatus){
    isNSS = nssStatus;
  }

  set setStudentLevel(String level){
    studentLevel = level;
  }

  String get getStudentName{
    return studentName;
  }

  String get getStudentID{
    return studentId;
  }

  String get getStudentIsNss{
    return isNSS ? 'Yes':'No';
  }

  int get getStudentAge{
    return studentAge;
  }

  String get getStudentLevel{
    return studentLevel;
  }

  String get getStudentCourse{
    return studentCourse;
  }

  String get getStudentEmail{
    return studentEmail;
  }
}