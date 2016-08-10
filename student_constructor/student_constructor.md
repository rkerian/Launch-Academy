### Part I: Many Arguments

Remember the code we supplied in [the reading](https://learn.launchacademy.com/lessons/intro-to-object-oriented-programming) for creating a `Student` instance 
that maintained the student's `first_name`, `last_name`, and `grades`?

Define the class and constructor that allows you to replicate the pry
output below. You should have a constructor that requires three arguments: 

* The student's first name
* The student's last name
* The student's list of grades

```no-highlight
pry(main)> Student.new('John', 'Smith', [90, 100, 85])
=> #<Student:0x007f8dc5398898 @first_name="John", @grades=[90, 100, 85], @last_name="Smith">
pry(main)> Student.new('Jane', 'Doe', [85, 100, 100])
=> #<Student:0x007f8dc53427b8 @first_name="Jane", @grades=[85, 100, 100], @last_name="Doe">
```

### Part II: One Argument

Create a completely different defintion of your `Student` class. This time,
require one argument to the constructor. This argument should represent the
relevant data required to provide a student's first name, last name, and list of
grades.

You should be able to replicate output similar to the following pry session using this new
constructor.

```no-highlight
pry(main)> Student.new({first_name: 'John', last_name: 'Smith', grades: [90, 100, 85]})
=> #<Student:0x007f8dc50d9328 @first_name="John", @grades=[90, 100, 85], @last_name="Smith">
pry(main)> Student.new({first_name: 'Jane', last_name: 'Doe', grades: [85, 100, 100]})
=> #<Student:0x007f8dc410cf08 @first_name="Jane", @grades=[85, 100, 100], @last_name="Doe">
```

{% show_hint %}
* Given the curly braces in the examples above, 
  what kind of data structure are you dealing with as it pertains to this version of the 
  constructor?
{% endshow_hint %}

### Part III: Maintain the average in `Student` State

Modify the constructor you created in **Part II** to also calculate the
student's average. Store that result in the instance's state.

```no-highlight
pry(main)> Student.new({first_name: 'John', last_name: 'Smith', grades: [90, 100, 85]})
=> #<Student:0x007f86fd92a028 @average=91.66666666666667, @first_name="John", @grades=[90, 100, 85], @last_name="Smith">
pry(main)> Student.new({first_name: 'Jane', last_name: 'Doe', grades: [85, 100, 100]})
=> #<Student:0x007f86fc09b430 @average=95.0, @first_name="Jane", @grades=[85, 100, 100], @last_name="Doe">
```
