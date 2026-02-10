-- Check recent emails from Mail.app
-- Usage: osascript scripts/email-check.scpt [count]

on run argv
    set maxCount to 10
    if (count of argv) > 0 then
        set maxCount to (item 1 of argv) as integer
    end if
    
    tell application "Mail"
        set allMessages to {}
        
        -- Get messages from all accounts' inboxes
        repeat with acc in accounts
            try
                set inboxMsgs to messages of inbox of acc
                set allMessages to allMessages & inboxMsgs
            end try
        end repeat
        
        set msgCount to count of allMessages
        if msgCount = 0 then
            return "No messages in inbox"
        end if
        
        set output to "Found " & msgCount & " messages. Showing " & (minimum of {maxCount, msgCount}) & ":" & linefeed & linefeed
        
        set recentMsgs to items 1 thru (minimum of {maxCount, msgCount}) of allMessages
        repeat with msg in recentMsgs
            set output to output & "From: " & (sender of msg) & linefeed
            set output to output & "Subject: " & (subject of msg) & linefeed
            set output to output & "Date: " & (date received of msg) & linefeed
            set output to output & "Read: " & (read status of msg) & linefeed
            set output to output & "---" & linefeed
        end repeat
        
        return output
    end tell
end run
