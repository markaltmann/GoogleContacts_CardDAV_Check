### Google Contacts Program that should be used to find out the contacts with the big pictures and other malformations not correctly interpreted by Windows Phone.
### The standard size of the Windows Contact Images is: 72 on 72 px

### Documentation:
# http://search.cpan.org/~merixzon/WWW-Google-Contacts-0.38/lib/WWW/Google/Contacts.pm

### Includes
use FindBin;
use WWW::Google::Contacts;

### Functions

# TODO: Create Function to check the photo for Size, resolution and ratio
# Some of my photos seem to not have any resolution, or are too big. Still looking into this.
# sub check_google_contact_photo {
    # # Get the photo
    # my ($filename) = @_;
    # open (my $photo, "<", $filename) or die "Can't open file [$filename]: $!";
    # # Check the content

    # # If the content is negative, return 1, else 0
    # return undef unless;
    # 1;
    
    # # Close the Photo (optional
    # close ($photo) or die "Can't close file [$filename]: $!";
# }

### Main

my $google = WWW::Google::Contacts->new(
    username => , # USER.ID
    password => , # PASSWORD. Mind the 2-factor-authentication
    protocol => "https",
);

# Create a new contact list for contacts with images
my $contacts = $google->contacts;

    while ( my $cont = $contacts->next ) {
      if ( $cont->photo->exists ) {
          print "You got a friend called " . $cont->full_name . " with photo!\n";
          # Save the picture to disk!
          print $FindBin::Bin . "/images/" . $cont->full_name . ".jpg";
          $cont->photo->to_file( $FindBin::Bin . "/images/" . $cont->full_name . ".jpg" );
          # TODO: Insert photo checker here
          
          # $cont->photo->delete;
          # $cont->update;
        }
      
    }