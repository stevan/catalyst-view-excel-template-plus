package TestApp;

use strict;
use warnings;

use FindBin;

use Catalyst;
use Excel::Template::Plus;
use Path::Class;

use TestApp::View::Excel;

__PACKAGE__->config({
    name => 'TestApp',
    'View::Excel::Template::Plus' => {
        etp_config => {
            INCLUDE_PATH => [ 
                (dir($FindBin::Bin, 'templates' )->stringify . '/'), 
            ]
        }
    }
});

__PACKAGE__->setup;

sub test_one : Global {
    my ($self, $c) = @_;  

    $c->stash->{template} = 'test_one.xml.tmpl';
    
    $c->stash->{message} = 'Hello (Excel) World';

    $c->forward('TestApp::View::Excel');
}


1;

__END__
