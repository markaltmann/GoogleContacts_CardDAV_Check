### Google Contacts Program that should be used to find out the contacts with the big pictures and other malformations not correctly interpreted by Windows Phone.
### The standard size of the Windows Contact Images is: 72 on 72 px

### Documentation:
# http://search.cpan.org/~merixzon/WWW-Google-Contacts-0.38/lib/WWW/Google/Contacts.pm

### Includes
use FindBin;
use WWW::Google::Contacts;

### Main

my $google = WWW::Google::Contacts->new(
    username => "USER.ID",
    password => "PASSWORD", # Mind the 2-factor-authentication.--
    protocol => "https",
);

# Create a new contact list for contacts with images
my $contacts = $google->contacts;

    while ( my $cont = $contacts->next ) {
      if ( $cont->photo->exists ) {
          print "You got a friend called " . $cont->full_name . " with photo!\n";
          # Save the picture to disk!
          print $FindBin::Bin . "/images/" . $cont->full_name . ".jpg\n";
          $cont->photo->to_file( $FindBin::Bin . "/images/" . $cont->full_name . ".jpg" );
          # Deletes the photo and saves the contact!
          $cont->photo->delete();
          $cont->photo->update();
          print "Photo should be deleted now! " . $cont->full_name . "\n\n"
        }
      
    }