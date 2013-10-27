--This is just a snippet on how to create a new project or todo
--Bruno Herfst 2013

--Set project Details
set My_Project_Name to "New Project"
set My_Tag to "test_tag"
set My_Due_Date to "1,20,14" --month,day,year

tell application "Things"
	--Create a new project
	set My_Project to make new project with properties {name:My_Project_Name} at beginning of list "Projects"
	set due date of My_Project to date My_Due_Date
	set tag names of My_Project to My_Tag
end tell


--Add new todo snippet

tell application "Things"
	--Select right project
	show project My_Project_Name
	set newTaskToEdit to make new to do with properties {name:"Test"} at beginning of project My_Project_Name
end tell