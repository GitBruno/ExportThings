# ExportWIPThings - for exporting Things work in progress projects to the Desktop as ThingsWIP.txt
# Based on the script of Dexter Ang (Thanks!)

set exportTag to "kids"
set theFilePath to (path to desktop as Unicode text) & "ThingsWIP.txt"
set theFile to (open for access file theFilePath with write permission)
set eof of theFile to 0
set pCount to 0

tell application "Things" to activate

tell application "Things"
	
	log completed now
	empty trash
	
	set allProjects to to dos of list "Projects"
	
	--First loop over the prject and count them for the header
	repeat with thisProject in allProjects
		set tagList to tags of thisProject
		set tagNames to tag names of thisProject
		repeat with thisTag in tagList
			set tagName to the name of thisTag
			if tagName is exportTag then
				set pCount to pCount + 1
			end if
		end repeat
	end repeat
	
	write "TOTAL PROJECTS: " & pCount & linefeed & linefeed to theFile
	
	repeat with thisProject in allProjects
		set tdName to the name of thisProject
		set tdDueDate to the due date of thisProject
		set tdNotes to the notes of thisProject
		set tagList to tags of thisProject
		set tagNames to tag names of thisProject
		
		repeat with thisTag in tagList
			set tagName to the name of thisTag
			if tagName is exportTag then
				write "------------------------------- " & linefeed to theFile
				write "+ " & tdName & linefeed to theFile
				write "------------------------------- " & linefeed to theFile
				if tdDueDate is not missing value then
					write "  Due: " & date string of tdDueDate & linefeed to theFile
				end if
				if tdNotes is not "" then
					# Append a "tab" to each line of tdNotes.
					repeat with noteParagraph in paragraphs of tdNotes
						write "  Status: " & noteParagraph & linefeed to theFile
					end repeat
				end if
				set prToDos to to dos of project tdName
				repeat with prToDo in prToDos
					set prtdName to the name of prToDo
					set prtdDueDate to the due date of prToDo
					
					write tab & "- " & prtdName & linefeed to theFile
					if prtdDueDate is not missing value then
						write tab & "  Due: " & date string of prtdDueDate & linefeed to theFile
					end if
				end repeat
				write linefeed to theFile
			end if
		end repeat
	end repeat
	
	close access theFile
	
end tell
