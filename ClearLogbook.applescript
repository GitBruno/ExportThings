# Bruno Herfst 2013
# ClearLogbook.scpt - clears the log by deleting all containing entries.

tell application "Things" to activate
tell application "Things"
	log completed now
	empty trash
	
	set loggedTodos to to dos of list "Logbook"
	
	repeat with entry in loggedTodos
		delete entry
	end repeat
end tell

