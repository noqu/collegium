\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##t
}
  
\header{
  title = "Chanson de Matin"
  subtitle = ""
  composer = "Edward Elgar (1857 - 1934)"
  tagline = "Op. 15 No. 2"
}

% Adapt this for automatic line-breaks
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 17)

% Useful snippets
pDolce = \markup { \dynamic p \italic \bold "dolce" }
pocoRit = ^\markup {\italic {"poco rit."} }
solo = ^\markup { "Solo" }
sic = ^\markup { \tiny { "sic!" } }
accel = ^\markup { \bold { "accel." } }
dieselben = ^\markup { \bold { "Dieselben ganzen Takte" } }


% ---------------------------------------------------------

clarinet_I_main = {
  \defaultTimeSignature
  \time 2/4
  \tempo "Allegretto"
  \key b \major
  \relative c''' {
    % cl1 page 1 line 1
    b8( \solo \mf\> f d es\! |
    c8 a g a) |
    b8( f d es |
    c8\dim a\! g a |
    b2~) |
    b4 r4 |
    r2 |
    \mBreak
  }
}

clarinet_II_main = {
  \defaultTimeSignature
  \time 2/4
  \tempo "Allegretto"
  \key b \major
  \relative c'' {

    % cl2 page 1 line 1
    b2~ |
    b8( a e4 |
    d8) r8 r4 |
    r4 e( |
    d4) r4 |
    r2 |
    r2 |
    \mBreak
  }
}

\bookpart {
  \header{
    instrument = "Klarinette I und II in Bb"
  }
  \score {
    \new GrandStaff <<
      \new Staff {
        \clarinet_I_main
      }
      \new Staff {
        \clarinet_II_main
      }
    >>
  }
}
