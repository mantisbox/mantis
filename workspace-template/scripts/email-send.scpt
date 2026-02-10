-- Send email via Mail.app
-- Usage: osascript scripts/email-send.scpt "to@email.com" "Subject" "Body text"

on run argv
    if (count of argv) < 3 then
        return "Usage: osascript email-send.scpt to@email.com \"Subject\" \"Body\""
    end if
    
    set toAddr to item 1 of argv
    set subj to item 2 of argv
    set body to item 3 of argv
    
    tell application "Mail"
        set newMessage to make new outgoing message with properties {subject:subj, content:body, visible:false}
        tell newMessage
            make new to recipient at end of to recipients with properties {address:toAddr}
        end tell
        send newMessage
    end tell
    
    return "Email sent to " & toAddr
end run
