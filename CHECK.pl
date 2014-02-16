### Google Contacts Program that should be used to find out the contacts with the big pictures and other malformations not correctly interpreted by Windows Phone.
### The standard size of the Windows Contact Images is: :TODO

### Documentation:
# http://search.cpan.org/~merixzon/WWW-Google-Contacts-0.38/lib/WWW/Google/Contacts.pm

use WWW::Google::Contacts;

my $google = WWW::Google::Contacts->new(
    username => "altmann.mark",
    password => "XXX",
    protocol => "https",
);

### Test Stuff you could do!

# Create a new contact
my $contact = $google->new_contact;
$contact->full_name("Emmett Brown");
$contact->name_prefix("Dr");
$contact->email('doctor@timetravel.org');
$contact->hobby("Time travel");
$contact->jot([ "Went back in time", "Went forward in time", "Became blacksmith" ]),
$contact->create;  # save it to the server

# Now search for the given name, and read the jots
my @contacts = $google->contacts->search({ given_name => "Emmett" });
foreach my $c ( @contacts ) {
    print "Got the following jots about the good doctor\n";
    foreach my $jot ( @{ $c->jot } ) {
        print "Jot: " . $jot->value . "\n";
    }
    print "And now he goes back to the future\n";
    $c->delete;
}

# Print the names of all groups
my $groups = $google->groups;
while ( my $group = $groups->next ) {
    print "Title = " . $group->title . "\n";
}

# Add the contact to existing group 'Movie stars' and to a new group 'Back to the future'
my $new_group = $google->new_group({ title => "Back to the future" });
$new_group->create;  # create on server

my @groups = $google->groups->search({ title => "Movie stars" });
my $movie_stars_group = shift @groups;

$contact->add_group_membership( $new_group );
$contact->add_group_membership( $movie_stars_group );
$contact->update;