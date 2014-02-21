# GoogleContacts_CardDAV_Check #

## Description ##
Check your Google Contacts how they are working together with CardDAV Clients.
Especially Windows Phone currently does not work nicely.
Thats mainly because some avatars seem to not be interpreted correctly by Windows Phone. Thus we delete them and do a quick backup ;)

Funny enough, you can run the script multiple times, and it will still find all your google contacts who have avatars/pictures.
I don't know whether thats somehow connected to the connected Google+ Profiles, as the contacts look exactly the same after as before, but alas:
It does the job and contact sync works for me...

## REQUIREMENT ##

* perl 6.05 (i recommend strawberry perl on windows....)
* CPAN: WWW-Google-Contacts which uses Google Contacts API: https://developers.google.com/google-apps/contacts/v3/?csw=1

## LINKS ##

* Various Posts in Microsoft Answers: 
** https://answers.microsoft.com/en-us/winphone/forum/wp7-sync/not-enough-memory-to-sync-error-code-8007000e/25ca4065-fe0b-40b3-a924-49395e450321?page=2
** http://answers.microsoft.com/en-us/winphone/forum/wp8-wpgroups/google-error-8007000e-your-phone-doesnt-have/c8a1e58b-6b94-4c3f-967c-c84e9e31af22
** http://answers.microsoft.com/en-us/winphone/forum/wp7-sync/error-code-8007000e-on-my-nokia-lumia-help/3a17e27e-6524-4203-b7e2-52cbbe0f367a
** http://answers.microsoft.com/en-us/winphone/forum/wp8-wpemail/lumia-920-gmail-sync-error-not-enough-space/73c2af4c-66b7-4486-80f2-8cfd74996a2f
* Good Blog Post by Borovicka with the old Active Sync Fix: http://borovicka.blogspot.de/2013/10/windows-phone-google-sync-error-8007000e.html
* As the current problem is mainly with pictures that are too big (by how much, is nowhere to be found...) have a look at the google contact pictures documentation: https://developers.google.com/google-apps/contacts/v3/?csw=1#contact_photo_management
* Cpan module contact photo management: http://search.cpan.org/~merixzon/WWW-Google-Contacts-0.38/lib/WWW/Google/Contacts/Photo.pm
