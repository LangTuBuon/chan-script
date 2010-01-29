;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GeekShed Management Script                   ;;
;; Version 1.0                                  ;;
;; Concept by Zetacon                           ;;
;; Input/Modifications by Phil, GrimReaper      ;;
;; All Rights Reserved                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;---------------------------Variables---------------------------

on 1:START:{
  set %gs.w.attitude Your attitude is not conducive to the desired environment.
  set %gs.w.hatespeech Hate Speech is not tolerated on GeekShed.
  set %gs.w.harassment Harassing Users is prohibited on GeekShed.
  set %gs.w.botnet Botnetting is strictly prohibited on GeekShed.
  set %gs.w.msgsnoperm You may not PM/DCC/Notice/Query/CTCP users without their expressed permission.
  set %gs.w.hack Hacking/Cracking/Piracy is not permitted.
  set %gs.w.language Please watch your language. We want everyone to feel welcome here.
  set %gs.w.flood Haven't you heard? Flooding is lame as any idiot can do it!
  set %gs.w.amsg Amsg/Ame's are not tolerated here.
  set %gs.w.spam Spamming is not tolerated here.
  set %gs.w.privacy Copyright & Privacy infringement are strictly prohibited.
  set %gs.w.oswars Operating system (OS) wars are not tolerated here.
  set %gs.w.caps Talking in caps is considered yelling, annoying, and rude. Please turn them off. Thanks.
  set %gs.w.persattack Personal attacks are not tolerated here.
  set %gs.w.nick Please change your nick.
  set %gs.w.illegal Illegal activities are not discussed here.

  set %gs.hn.commands a list of GeekShed commands can be found at: http://www.geekshed.net/commands
  set %gs.hn.getchat get a chat for your website by visiting http://geekshed.net/getchat
  set %gs.hn.news read the latest GeekShed News! http://www.geekshed.net/news/
  set %gs.hn.help this channel is for IRC related help only. If you need help with your computer, please visit #geekstogo, #bleepingcomputer, or #chris.
  set %gs.hn.limits view a list of all of our limitations at http://www.geekshed.net/2009/10/what-are-the-limits-on-geekshed
  set %gs.hn.regchan registering a channel on GeekShed is easy! Please see the following link to learn how: http://www.geekshed.net/2009/10/how-to-register-a-channel-on-geekshed/
  set %gs.hn.regnick for instructions on registering your nick, see: http://www.geekshed.net/2009/11/why-should-i-register-my-nickname-and-how-do-i-do-it/
  set %gs.hn.extendbans to learn how to use extended ban types, please see the following tutorial: http://www.geekshed.net/2009/11/extended-bans-tutorial/
  set %gs.hn.ask please ask your question so we may try and help you.
  set %gs.hn.helpguidelines please read the #Help Guidelines: http://www.geekshed.net/2009/11/guidelines-for-help-channel/
  set %gs.hn.founders to learn how to set more than one channel founder by visiting: http://www.geekshed.net/2009/11/can-my-geekshed-channel-have-more-than-one-founder/
  set %gs.hn.sslcertficate learn about our certificate authority through this link: http://www.geekshed.net/2009/10/geekshed-certificate-authority/
  set %gs.hn.userbadge visit our User Count Badge generator: http://www.geekshed.net/2009/10/user-count-badges/
  set %gs.hn.tos please read the GeekShed Terms of Service: http://www.geekshed.net/tos/
  set %gs.hn.ports to see the ports you can use to connect to GeekShed, see: http://www.geekshed.net/2010/01/what-ports-can-i-use-to-connect-to-geekshed/
  set %gs.hn.owner you can see who owns GeekShed at: http://www.geekshed.net/2009/12/who-owns-geekshed-irc/
  set %gs.hn.clients a list of IRC clients can be found at: http://www.geekshed.net/2009/12/irc-clients/
  set %gs.hn.qdb the GeekShed quote database can be found at: http://www.geekshed.net/qdb/
  set %gs.hn.access a tutorial for using the access system can be found at http://www.geekshed.net/2009/12/access-system-tutorial/
  set %gs.hn.bots for instructions adding a botserv bot to your channel and for a list of bots see: http://www.geekshed.net/2009/11/how-do-i-add-a-botserv-bot-to-my-channel/ and http://www.geekshed.net/2009/11/can-i-make-my-own-botserv-bot/
  set %gs.hn.ipv6 GeekShed does have IPv6 support. See http://www.geekshed.net/2009/11/does-geekshed-have-ipv6-support/ for info
  set %gs.hn.flood for instructions on setting flood protection in your channel see: http://www.geekshed.net/2009/11/channel-flood-protection-tutorial/
  set %gs.hn.oper if you're interested in becoming an IRCOp on GeekShed see: http://www.geekshed.net/2009/11/can-i-be-an-oper-on-geekshed/
  set %gs.hn.link if you want to link a server to GeekShed see http://www.geekshed.net/2009/11/can-i-link-a-server-to-geekshed/ for information
  set %gs.hn.vhost if you would like a GeekShed vhost, join #vhosts and read http://www.geekshed.net/2009/11/can-i-have-a-vhost-on-geekshed/
}

;---------------------------Aliases---------------------------

alias kb {
  if ($1 ison $chan) { 
    mode $chan +b $address($1,2)
    kick $chan $1-
  }
  else {
    echo -a $1 is not on $chan
  }
}

alias founder {
  cs SET $chan XOP OFF
  cs ACCESS $chan ADD $1 9999

  echo -a $1 has been set as founder of $chan $+ . They must now cycle it and rejoin it. XOP has been turned OFF! This means that you must now use the access system. For help doing this, visit http://www.geekshed.net/2009/12/access-system-tutorial/
}

alias permsop {
  cs sop $chan add $1
  mode $chan +ao $1 $1
}

alias permaop {
  cs aop $chan add $1
  mode $chan +o $1
}

alias permhop {
  cs hop $chan add $1
  mode $chan +h $1
}

alias permvop {
  cs vop $chan add $1
  mode $chan +v $1
}

alias tempsop {
  if ($1 ison $chan) {
    mode $chan +ao $1 $1
  }
}




;---------------------------Nicklist Menu---------------------------

menu nicklist {
  -
  GeekShed Management Script
  .Discipline
  ..Warn
  ..Kick
  ...Kick (No Reason):/kick $chan $$1
  ...Kick (Custom):/kick $chan $$1 $$?="Enter a reason"
  ...Kick (Scripted)
  ....Attitude:/kick $chan $$1 %gs.w.attitude
  ....AMSG/AME:/kick $chan $$1 %gs.w.amsg
  ....Caps:/kick $chan $$1 %gs.w.caps
  ....Flooding:/kick $chan $$1 %gs.w.flood
  ....Hate Speech:/kick $chan $$1 %gs.w.hatespeech
  ....Illegal:/kick $chan $$1 %gs.w.illegal
  ....Change Nick:/kick $chan $$1 %gs.w.nick
  ....Foul Language:/kick $chan $$1 %gs.w.language
  ....No PMs:/kick $chan $$1 %gs.w.msgsnoperm
  ....Personal Attacks:/kick $chan $$1 %gs.w.persattack
  ....Spamming:/kick $chan $$1 %gs.w.spam
  ..Ban:/mode $chan +b $address($$1,2)
  ..Mute:/mode $chan +bb ~q: $+ $address($$1,2) ~n: $+ $address($$1,2)
  ..KickBan
  ...KickBan (No Reason):/kb $$1
  ...KickBan (Custom):/kb $$1 $$?="Enter a reason"
  ...Kickban (Scripted)
  ....Attitude:/kb $$1 %gs.w.attitude
  ....AMSG/AME:/kb $$1 %gs.w.amsg
  ....Caps:/kb $$1 %gs.w.caps
  ....Flooding:/kb $$1 %gs.w.flood
  ....Hate Speech:/kb $$1 %gs.w.hatespeech
  ....Illegal:/kb $$1 %gs.w.illegal
  ....Change Nick:/kb $$1 %gs.w.nick
  ....Foul Language:/kb $$1 %gs.w.language
  ....No PMs:/kb $$1 %gs.w.msgsnoperm
  ....Personal Attacks:/kb $$1 %gs.w.persattack
  ....Spamming:/kb $$1 %gs.w.spam
  .Help
  ..Access System:/say $$1 $+ , %gs.hn.access
  ..Adding BotServ:/say $$1 $+ , %gs.hn.bots
  ..Ask Question:/say $$1 $+ , %gs.hn.ask
  ..Certificate Authority:/say $$1 $+ , %gs.hn.sslcertficate
  ..Channel Registration: /say $$1 $+ , %gs.hn.regchan
  ..Commands List:/say $$1 $+ , %gs.hn.commands
  ..Computer Help:/say $$1 $+ , %gs.hn.help
  ..Extended Bans:/say $$1 $+ , %gs.hn.extendbans
  ..Flash Client:/say $$1 $+ , %gs.hn.getchat
  ..Flood Protection:/say $$1 $+ , %gs.hn.flood
  ..Founders:/say $$1 $+ , %gs.hn.founders
  ..Help Guidelines:/say $$1 , %gs.hn.helpguidelines
  ..ipv6 Support:/say $$1 , %gs.hn.ipv6
  ..Latest News:/say $$1 $+ , %gs.hn.news
  ..Limitations:/say $$1 $+ , %gs.hn.limits
  ..Server Linking:/say $$1 $+ , %gs.hn.link
  ..Nick Registration:/say $$1 $+ , %gs.hn.regnick
  ..Oper Info:/say $$1 $+ , %gs.hn.oper
  ..Quote Database:/say $$1 $+ , %gs.hn.qdb
  ..Terms of Service:/say $$1 $+ , %gs.hn.tos
  ..User Badge:/say $$1 $+ , %gs.hn.userbadge
  ..vHosts:/say $$1 $+ , %gs.hn.vhost
  .ChanServ
  ..Status
  ...Permanent
  ....QOP:/founder $$1 
  ....SOP:/permsop $$1 
  ....AOP:/permaop $$1 
  ....HOP:/permhop $$1 
  ....VOP:/permvop $$1
  ...Temporary
  ....SOP:/tempsop $$1 
  ....AOP:/mode $chan +o $$1 
  ....HOP:/mode $chan +h $$1 
  ....VOP:/mode $chan +v $$1
  .NickServ
  ..Info:/ns info $$1 all
  ..Whois:/whois $$1
}


menu channel {
  -
  GeekShed Management Script
  .Channel Settings
  ..Change Founder:/cs set $$?="Enter channel:" founder $$?="Enter New Founder"
  ..Change Successor:/cs set $$?="Enter channel:" successor $$?="Enter nick:"
  ..Change Password:/cs set $$?="Enter channel:" passwd $$?*="Enter old password:" $$?*="Enter new password:"
  ..Change Description:/cs set $$?="Enter channel:" desc $$?="Enter new description:"
  .Channel Modes $+ $chr(58) $+ $chr(9) $+ $chan(#).mode
  ..$iif(c isincs $gettok($chan(#).mode,1,32),$style(1)) No Colors:{ if (c isincs $gettok($chan(#).mode,1,32)) { mode # -c } | else { mode # +c } }
  ..$iif(i isincs $gettok($chan(#).mode,1,32),$style(1)) Invite Only:{ if (i isincs $gettok($chan(#).mode,1,32)) { mode # -i } | else { mode # +i } }
  ..$iif(M isincs $gettok($chan(#).mode,1,32),$style(1)) Only Registered Nicks Can Speak:{ if (M isincs $gettok($chan(#).mode,1,32)) { mode # -M } | else { mode # +M } }
  ..$iif(m isincs $gettok($chan(#).mode,1,32),$style(1)) Moderated:{ if (m isincs $gettok($chan(#).mode,1,32)) { mode # -m } | else { mode # +m } }
  ..$iif(n isincs $gettok($chan(#).mode,1,32),$style(1)) No External Messages:{ if (n isincs $gettok($chan(#).mode,1,32)) { mode # -n } | else { mode # +n } }
  ..$iif(p isincs $gettok($chan(#).mode,1,32),$style(1)) Private:{ if (p isincs $gettok($chan(#).mode,1,32)) { mode # -p } | else { mode # +p } }
  ..$iif(R isincs $gettok($chan(#).mode,1,32),$style(1)) Registered Nicks Only:{ if (R isincs $gettok($chan(#).mode,1,32)) { mode # -R } | else { mode # +R } }
  ..$iif(s isincs $gettok($chan(#).mode,1,32),$style(1)) Secret:{ if (s isincs $gettok($chan(#).mode,1,32)) { mode # -s } | else { mode # +s } }
  ..$iif(t isincs $gettok($chan(#).mode,1,32),$style(1)) Only Ops Set Topic:{ if (t isincs $gettok($chan(#).mode,1,32)) { mode # -t } | else { mode # +t } }
  ..$iif(l isincs $gettok($chan(#).mode,1,32),$style(1) User Limit $+ $chr(58) $chan(#).limit,User Limit):{ if (l isincs $gettok($chan(#).mode,1,32)) { mode # -l } | else { mode # +l $$?"Maximum number of users allowed in # $+ :" } }
  ..$iif(k isincs $gettok($chan(#).mode,1,32),$style(1) Key $+ $chr(58) $chan(#).key,Key):{ if (k isincs $gettok($chan(#).mode,1,32)) { mode # -k $chan(#).key } | else { mode # +k $$?"Enter key for # $+ :" } }
  .Discipline
  ..Kick
  ...Kick (No Reason):/kick $chan $$?="Enter the nick you wish to kick"
  ...Kick (Custom):/kick $chan $$?="Enter the nick you wish to kick" $$?="Enter the reason"
  ...Kick (Scripted)
  ....Attitude:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.attitude
  ....AMSG/AME:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.amsg
  ....Caps:/kick $chan $$1 %gs.w.caps
  ....Flooding:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.flood
  ....Hate Speech:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.hatespeech
  ....Illegal:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.illegal
  ....Change Nick:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.nick
  ....Foul Language:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.language
  ....No PMs:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.msgsnoperm
  ....Personal Attacks:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.persattack
  ....Spamming:/kick $chan $$?="Enter the nick you wish to kick" %gs.w.spam
  ..Ban:/mode $chan +b $address($$?="Enter the nick that you wish to ban (Will retrieve the host)",2)
  ..KickBan
  ...KickBan (No Reason):/kb $$?="Enter the nick you wish to kick"
  ...KickBan (Custom):/kb $$?="Enter the nick you wish to kick" $$?="Enter a reason"
  ...Kickban (Scripted)
  ....Attitude:/kb $$?="Enter the nick you wish to kick" %gs.w.attitude
  ....AMSG/AME:/kb $$?="Enter the nick you wish to kick" %gs.w.amsg
  ....Caps:/kb $$?="Enter the nick you wish to kick" %gs.w.caps
  ....Flooding:/kb $$?="Enter the nick you wish to kick" %gs.w.flood
  ....Hate Speech:/kb $$?="Enter the nick you wish to kick" %gs.w.hatespeech
  ....Illegal:/kb $$?="Enter the nick you wish to kick" %gs.w.illegal
  ....Change Nick:/kb $$?="Enter the nick you wish to kick" %gs.w.nick
  ....Foul Language:/kb $$?="Enter the nick you wish to kick" %gs.w.language
  ....No PMs:/kb $$?="Enter the nick you wish to kick" %gs.w.msgsnoperm
  ....Personal Attacks:/kb $$?="Enter the nick you wish to kick" %gs.w.persattack
  ....Spamming:/kb $$?="Enter the nick you wish to kick" %gs.w.spam
  .Help
  ..Access System:/say %gs.hn.access
  ..Adding BotServ:/say %gs.hn.bots
  ..Ask Question:/say %gs.hn.ask
  ..Certificate Authority:/say %gs.hn.sslcertficate
  ..Channel Registration: /say %gs.hn.regchan
  ..Commands List:/say %gs.hn.commands
  ..Computer Help:/say %gs.hn.help
  ..Extended Bans:/say %gs.hn.extendbans
  ..Flash Client:/say %gs.hn.getchat
  ..Flood Protection:/say %gs.hn.flood
  ..Founders:/say %gs.hn.founders
  ..Help Guidelines:/say %gs.hn.helpguidelines
  ..ipv6 Support:/say %gs.hn.ipv6
  ..Latest News:/say %gs.hn.news
  ..Limitations:/say %gs.hn.limits
  ..Server Linking:/say %gs.hn.link
  ..Nick Registration:/say %gs.hn.regnick
  ..Oper Info:/say %gs.hn.oper
  ..Quote Database:/say %gs.hn.qdb
  ..Terms of Service:/say %gs.hn.tos
  ..User Badge:/say %gs.hn.userbadge
  ..vHosts:/say %gs.hn.vhost
  .BotServ
  ..Assign:/bs ASSIGN $chan $$?="Enter the desired Services bot"
  ..Unassign:/bs UNASSIGN $chan $$?="Enter the Services bot you wish to unassign"
  ..List:/bs botlist
  ..Say:/bs say $chan $$?="Enter what you wish the Service bot to say"
  ..Act:/bs act $chan $$?="Enter what you wish the Service bot to act"
  .ChanServ
  ..Info:/cs info $$?="Enter the channel you want info (#channel)" all
  ..Join:/join $$?="Enter the channel(s) you wish to join (#chan1,#chan2,#chan3)"
  ..Part:/part $$?="Enter the channel(s) you wish to part (#chan1,#chan2,#chan3)"
  ..Modes
  ...Moderate
  ....On:/mode $chan +m
  ....Off:/mode $chan -m
  ...Invite-Only
  ....On:/mode $chan +i
  ....Off:/mode $chan -i
  ...ANSI Color Block
  ....On:/mode $chan +c
  ....Off:/mode $chan -c
  ...CTCP Blocker
  ....On:/mode $chan +C
  ....Off:/mode $chan -C
  ...Nick change blocker
  ....On:/mode $chan +N
  ....Off:/mode $chan -N
  ...Foul Language Filter
  ....On:/mode $chan +G
  ....Off:/mode $chan -G
  ...Secret Channel
  ....On:/mode $chan +s
  ....Off:/mode $chan -s
  ...Set Topic (Op Only)
  ....On:/mode $chan +t
  ....Off:/mode $chan -t
  ...Color Stripper
  ....On:/mode $chan +S
  ....Off:/mode $chan -S
  ...No Outside Messages
  ....On:/mode $chan +n
  ....Off:/mode $chan -n
  ...No Notices
  ....On:/mode $chan +T
  ....Off:/mode $chan -T
  ...Private Channel
  ....On:/mode $chan +p
  ....Off:/mode $chan -p
  ...Strip Formatting
  ....On:/mode $chan +U
  ....Off:/mode $chan -U
  ...Invite Not Allowed
  ....On:/mode $chan +V
  ....Off:/mode $chan -V
  ...SSL Connection Only
  ....On:/mode $chan +z
  ....Off:/mode $chan -z
  ...Registered Nicks Only
  ....On:/mode $chan +R
  ....Off:/mode $chan -R
  ..Channel Status
  ...Permanent
  ....QOP:/founder $$?="Enter the nick you wish to set as a founder"
  ....SOP:/permsop $$?="Enter the nick you wish to set as admin"
  ....AOP:/permaop $$?="Enter the nick you wish to set as op" 
  ....HOP:/permhop $$?="Enter the nick you wish to set as half-op"
  ....VOP:/permvop $$?="Enter the nick you wish to set as voice"
  ...Temporary
  ....SOP:/tempsop $$?="Enter the nick you wish to set as temporary admin"
  ....AOP:/mode $chan +o $$?="Enter the nick you wish to set as temporary op"
  ....HOP:/mode $chan +h $$?="Enter the nick you wish to set as temporary half-op"
  ....VOP:/mode $chan +v $$?="Enter the nick you wish to set as a temporary voice"
  .MemoServ
  ..List Memos:/ms list
  ..Send
  ...No Read Receipt:/ms SEND nick $$?="Enter the nick you wish to send a Memo" $$?="Enter the message for the Memo"
  ...Read Receipt:/ms RSEND nick $$?="Enter the nick you wish to send a Memo" $$?="Enter the message for the Memo"
  ..Delete
  ...All:/ms DEL $chan ALL
  ...Last:/ms DEL $chan LAST
  ...Number:/ms DEL $chan $$?="Enter the Memo number to delete (ex: '1','2-5','7-9')"
  ..Read
  ...
  ..Settings
  ...Info:
  ...Limit:/ms SET LIMIT $$?="Enter the Memo Limit (Maximum of 20)"
  ...Notify
  ....On:
  ....Off:
  ....Logon:
  ....Mail:
  ....NoMail:
  .NickServ
  ..Whois:/whois $$?="Enter the nick you want to whois"
  ..Whois (Idle):/set -u3 %tempwhois $$?="Please enter the nick you want to whois" | .timer 1 1 whois %tempnick %tempnick
  ..Info:/ns info $$?="Enter the nick you want info"
  ..Change Nick:/nick $$?="Enter your new nick"
  ..Group:/ns group $$?="Enter your main nick" $$?="Enter your password"
}

menu status {
  -
  GeekShed Management Script
  .ChanServ
  ..Info:/cs info $$?="Enter the channel you want info (#channel)" all
  ..Register:/cs register $$?="Enter the channel name you wish to register" $$?="Please enter a channel password" $$?="Please enter a channel Description:"
  ..Channel Settings
  ...Change Founder:/cs set $$?="Enter channel:" founder $$?="Enter New Founder"
  ...Change Successor:/cs set $$?="Enter channel:" successor $$?="Enter nick:"
  ...Change Password:/cs set $$?="Enter channel:" passwd $$?*="Enter old password:" $$?*="Enter new password:"
  ...Change Description:/cs set $$?="Enter channel:" desc $$?="Enter new description:"
  ..Channel Modes $+ $chr(58) $+ $chr(9) $+ $chan(#).mode
  ...$iif(c isincs $gettok($chan(#).mode,1,32),$style(1)) No Colors:{ if (c isincs $gettok($chan(#).mode,1,32)) { mode # -c } | else { mode # +c } }
  ...$iif(i isincs $gettok($chan(#).mode,1,32),$style(1)) Invite Only:{ if (i isincs $gettok($chan(#).mode,1,32)) { mode # -i } | else { mode # +i } }
  ...$iif(M isincs $gettok($chan(#).mode,1,32),$style(1)) Only Registered Nicks Can Speak:{ if (M isincs $gettok($chan(#).mode,1,32)) { mode # -M } | else { mode # +M } }
  ...$iif(m isincs $gettok($chan(#).mode,1,32),$style(1)) Moderated:{ if (m isincs $gettok($chan(#).mode,1,32)) { mode # -m } | else { mode # +m } }
  ...$iif(n isincs $gettok($chan(#).mode,1,32),$style(1)) No External Messages:{ if (n isincs $gettok($chan(#).mode,1,32)) { mode # -n } | else { mode # +n } }
  ...$iif(p isincs $gettok($chan(#).mode,1,32),$style(1)) Private:{ if (p isincs $gettok($chan(#).mode,1,32)) { mode # -p } | else { mode # +p } }
  ...$iif(R isincs $gettok($chan(#).mode,1,32),$style(1)) Registered Nicks Only:{ if (R isincs $gettok($chan(#).mode,1,32)) { mode # -R } | else { mode # +R } }
  ...$iif(s isincs $gettok($chan(#).mode,1,32),$style(1)) Secret:{ if (s isincs $gettok($chan(#).mode,1,32)) { mode # -s } | else { mode # +s } }
  ...$iif(t isincs $gettok($chan(#).mode,1,32),$style(1)) Only Ops Set Topic:{ if (t isincs $gettok($chan(#).mode,1,32)) { mode # -t } | else { mode # +t } }
  ...$iif(l isincs $gettok($chan(#).mode,1,32),$style(1) User Limit $+ $chr(58) $chan(#).limit,User Limit):{ if (l isincs $gettok($chan(#).mode,1,32)) { mode # -l } | else { mode # +l $$?"Maximum number of users allowed in # $+ :" } }
  ...$iif(k isincs $gettok($chan(#).mode,1,32),$style(1) Key $+ $chr(58) $chan(#).key,Key):{ if (k isincs $gettok($chan(#).mode,1,32)) { mode # -k $chan(#).key } | else { mode # +k $$?"Enter key for # $+ :" } }
  .MemoServ
  ..List Memos:/ms list
  ..Send
  ...No Read Receipt:/ms SEND nick $$?="Enter the nick you wish to send a Memo" $$?="Enter the message for the Memo"
  ...Read Receipt:/ms RSEND nick $$?="Enter the nick you wish to send a Memo" $$?="Enter the message for the Memo"
  ..Delete
  ..Read
  ..Settings
  ...Info:
  ...Limit:/ms SET LIMIT $$?="Enter the Memo Limit (Maximum of 20)"
  ...Notify
  ....On:
  ....Off:
  ....Logon:
  ....Mail:
  ....NoMail:
  .NickServ
  ..Whois:/whois $$?="Enter the nick you want to whois"
  ..Whois (Idle):/set -u3 %whoistemp $$?="Please enter the nick you want to whois" | .timer 1 1 whois %whoistemp %whoistemp
  ..Info:/ns info $$?="Enter the nick you want info"
  ..Change Nick:/nick $$?="Enter your new nick"
  ..Group:/ns group $$?="Enter your main nick" $$?="Enter your password"
}