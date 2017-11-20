#!/bin/bash


echo "Please enter your name: "
read studentName
while ! [[ $studentName =~ ^-?[[:alpha:]]+$ || $studentName =~ " " ]]; do
	echo "Invalid input, please try again: "
	read studentName
done


echo "Please enter your ID: "
read studentID
while ! [[ $studentID =~ ^-?[[:digit:]]+$ ]]; do
	echo "invalid studentID, please try again: "
	read studentID
done


echo "Please enter your gender: "
read gender
while ! [[ $gender =~ ^-?[[:alpha:]]+$ ]]; do
	echo "Invalid gender, please try again: "
	read gender
done


echo "Please enter your assignment mark (0 - 20): "
read assignmentMark
while ! [[ $assignmentMark =~ ^-?[[:digit:]]+$ || $assignmentMark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ && $assignmentMark -ge 0 && $assignmentMark -le 20 ]]; do
	echo "Please try again, your assignment must be between 0 and 20: "
	read assignmentMark
done	


echo "Please enter your lab participation mark (0 - 10): "
read labParticipationMark
while ! [[ $labParticipationMark =~ ^-?[[:digit:]]+$ || $labParticipationMark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ && $labParticipationMark -ge 0 && $labParticipationMark -le 10 ]]; do
	echo "Please try again, your lab participation mark must be between 0 and 10 "
	read labParticipationMark
done

echo "Please enter your quiz mark (0 - 10): "
read quizmark
while ! [[ $quizmark =~ ^-?[[:digit:]]+$ || $quizmark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ && $quizmark -ge 0 && $quizmark -le 10 ]]; do
	echo "Please try again, your quiz mark must be between 0 and 10"
	read quizmark
done


echo "Please enter your midterm mark (0 - 30):"
read midtermMark
while ! [[ $midtermMark =~ ^-?[[:digit:]]+$ || $midtermMark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ && $midtermMark -ge 0 && $midtermMark -le 30 ]]; do
	echo "Please try again, your midterm mark must be between 0 and 30: "
	read midtermMark
done

echo "Please enter your final mark (0 - 30): "
read finalMark
while ! [[ $finalMark =~ ^-?[[:digit:]]+$ || $finalMark =~ ^-?[[:digit:]]*\.[[:digit:]]+$ && $finalMark -ge 0 && $finalMark -le 30 ]]; do
	echo "Please try again, your final mark must be between 0 and 30: "
	read finalMark
done


total=`expr $assignmentMark + $labParticipationMark + $quizmark + $midtermMark + $finalMark`



if [[ $total -gt 90 && $total -le 100 ]]; then
	finalGrade="A"
	
elif [[ $total -eq 90 ]]; then
	finalGrade="A-"
	
elif [[ $total -gt 80 && $total -lt 90 ]]; then
	finalGrade="B"

elif [[ $total -eq 80 ]]; then
	finalGrade="B-"

elif [[ $total -gt 70 && $total -lt 80 ]]; then
	finalGrade="C"

elif [[ $total -eq 70 ]]; then
	finalGrade="C-"

elif [[ $total -ge 60 && $total -lt 70 ]]; then
	finalGrade="D"

elif [[ $total -lt 60 ]]; then
	finalGrade="F"
fi

#echo "Student Name", "Student ID", "Student Gender", "Assignment Mark", "Lab Participation Mark", "Quiz Mark", "Midterm Mark", "Final Mark", "Overall Mark", "Final Grade" >> OSSGrades.csv

echo "$studentName", "$studentID", "$gender", "$assignmentMark", "$labParticipationMark", "$quizmark", "$midtermMark", "$finalMark", "$total", "$finalGrade" >> OSSGrades.csv

