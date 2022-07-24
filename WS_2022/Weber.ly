\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
}

\header{
  title = "Concertino für Horn und Orchester"
  subtitle = "Op.45 e-moll"
  composerShort = "Carl Maria von Weber"
  composer = "Carl Maria von Weber (1786 - 1826)"
  tagline = ""
}

% Adapt this for automatic line-breaks
mBreak = {}
mBreak = { \break }
#(set-global-staff-size 16)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
fCantabile = _\markup { \dynamic f \italic "cantabile" }
smorz = _\markup { \italic "smorz." }
sempreFf = _\markup { \italic "sempre" \dynamic ff }
sempreFff = _\markup { \italic "sempre" \dynamic fff }
pocoF = _\markup { \italic "poco" \dynamic f }
ffz = _\markup { \dynamic { ffz } } 
crescMolto = _\markup { \italic "cresc. molto" }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
sempreCresc = _\markup { \italic "sempre cresc." }
ppEspr = _\markup { \dynamic pp \italic "espr." }
ppiuEspress = _\markup { \dynamic p \italic "più espress." }
pocoCresc = _\markup { \italic "poco cresc." }
mfEspress = _\markup { \dynamic mf \italic "espress." }
pEspress = _\markup { \dynamic p \italic "espress." }
string = ^\markup { \italic "string." }
stringendo = ^\markup { \italic "stringendo" }
pocoString = ^\markup { \italic "poco string." }
sempreStringendo = ^\markup { \italic "sempre stringendo" }
sempreString = ^\markup { \italic "sempre string." }
tuttaForza = _\markup { \italic "tutta forza" }
allargando = _\markup { \italic "allargando" }
pocoMenoMosso = ^\markup {\italic \bold {"Poco meno mosso."} }
rit = ^\markup {\italic {"rit."} }
rall = ^\markup {\italic {"rall."} }
riten = ^\markup {\italic {"riten."} }
ritATempo = ^\markup { \center-align \italic {"  rit. a tempo"} }
aTempo = ^\markup { \italic {"a tempo"} }
moltoRit = ^\markup { \italic {"molto rit."} }
pocoRit = ^\markup {\italic {"poco rit."} }
pocoRiten = ^\markup {\italic {"poco riten."} }
sec = ^\markup {\italic {"sec."} }
pocoRall = ^\markup {\italic {"poco rall."} }
pocoAPocoRall = ^\markup {\italic {"poco a poco rall."} }
pocoAPocoAccel = ^\markup {\italic {"poco a poco accel."} }
pocoAPocoAccelAlD = ^\markup {\italic {"poco a poco accel. al D"} }
sempreAccel = ^\markup {\italic {"sempre accel."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
piuP = _\markup { \italic "più" \dynamic p }
lento = ^\markup { \italic "Lento" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \italic { "Tempo I" } }

% Adapted from http://lsr.di.unimi.it/LSR/Snippet?id=655
% Make title, subtitle, instrument appear on pages other than the first
#(define (part-not-first-page layout props arg)
   (if (not (= (chain-assoc-get 'page:page-number props -1)
               (ly:output-def-lookup layout 'first-page-number)))
       (interpret-markup layout props arg)
       empty-stencil))

\paper {
  oddHeaderMarkup = \markup
  \fill-line {
    " "
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
  % Distance between title stuff and music
  markup-system-spacing.basic-distance = #12
  markup-system-spacing.minimum-distance = #12
  markup-system-spacing.padding = #10
  % Distance between music systems
  system-system-spacing.basic-distance = #14
  system-system-spacing.minimum-distance = #14
  % system-system-spacing.padding = #10
  
}

% ---------------------------------------------------------

clarinet_I = {
  \set Score.markFormatter = #format-mark-alphabet
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 4/4
  \tempo "Adagio"
  \key c \major
  \clef violin
  \relative c' {
    % p1 1
    g''1\ff~ |
    g2 r \fermata |
    d1\pp\<~ |
    d2\> r\! \fermata
    \mBreak
    
    % p1 2
    \time 6/8
    R1*6/8*6 |
    a2.(\p |
    b4. f |
    g4. es |
    d4.) r |
    R1*6/8*7 |
    \mBreak
    
    %p1 3
    r8 d'(\pp d d cis c |
    b8) r8 r r4. |
    r8 d( d d cis c |
    b8) r8 r r4. |
    R1*6/8 |
    R1*6/8  \fermataMarkup |
    \bar "||"
    \mBreak
    
    %p1 4
    \time 2/4
    \repeat volta 2 {
      R1*2/4*8
    }
    \repeat volta 2 {
      R1*2/4*8
    }
    h'4( g) |
    e8( fis g a) |
    \slashedGrace g8 fis8-. e-. fis4 |
    g4( d) |
    \mBreak
    
    %p1 5
    h'4( g) |
    e8( fis g a) |
    \slashedGrace g8 fis8-. e-. fis4 |
    g4. r8 |
    \repeat volta 2 {
      R1*2/4*8
    }
    \repeat volta 2 {
      R1*2/4*8
    }
    \mBreak
    
    %p1 6
    R1*2/4 |
    r4 r8 c,( |
    h c d e) |
    h4( a8) r |
    R1*2/4*4 |
    \mBreak
    
    %p1 7
    \repeat volta 2 {
      g'8\f r r4 |
      R1*2/4 |
      a8 r r a |
      g8 r r4 |
      g8 r r4 |
      R1*2/4 |
      a8 r r a |
      g8 r r4 |
    }
    \mBreak
    
    %p1 8
    \repeat volta 4 {
      R1*2/4*4 |
      g8 r r4 |
      R1*2/4 |
      a8 r r a |
      g8 r r4 |
    }
    fis4(\ff g8) r |
    R1*2/4 |
    a8\p a a a |
    \mBreak
    
    %p1 9
    g2 |
    fis4(\ff g8) r |
    R1*2/4 |
    a8\p a a a |
    \repeat volta 2 {
      g4 r |
      R1*2/4*7 |
    }
    \repeat volta 2 {
      R1*2/4*8 |
    }
    \mBreak
    
    %p10
    R1*2/4*7
    \mBreak
  }
}

clarinet_II = {
  \set Score.markFormatter = #format-mark-alphabet
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 4/4
  \tempo "Adagio"
  \key c \major
  \clef violin
  \relative c' {
    % p1 1
    g'1 |
    g2 r \fermata |
    d1\pp\<~ |
    d2\> r\! \fermata
    \mBreak
    
    % p1 2
    \time 6/8
    R1*5/8*6 |
    r4. f,4.~\p |
    f2. |
    b2. |
    es4. f, |
    b4. r |
    R1*6/8*7 |
    \mBreak
    
    
    %p1 3
    r8 a'(\pp a a a a |
    g8) r8 r r4. |
    r8 a( a a a a |
    g8) r8 r r4. |
    R1*6/8 |
    R1*6/8  \fermataMarkup |
    \bar "||"
    \mBreak
    
    %p1 4
    \time 2/4
    \repeat volta 2 {
      R1*2/4*8
    }
    \repeat volta 2 {
      R1*2/4*8
    }
    d'2(\f |
    c2~ |
    c2 |
    h2) |
    \mBreak
    
    %p1 5
    h8 c d dis |
    e8 c d e |
    d8-. cis-. c-. a-. |
    h4. r8 |
    \repeat volta 2 {
      R1*2/4*8
    }
    \repeat volta 2 {
      R1*2/4*8
    }
    \mBreak
    
    %p1 6
    R1*2/4*8 |
    \mBreak
    
    %p1 7
    \repeat volta 2 {
      d8\f r r4 |
      R1*2/4 |
      fis8 r r fis |
      d8 r r4 |
      d8 r r4 |
      R1*2/4 |
      fis8 r r fis |
      d8 r r4 |
    }
    
    %p1 8
    \repeat volta 2 {
      R1*2/4*4 |
      d8 r r4 |
      R1*2/4 |
      fis8 r r fis |
      d8 r r4 |
    }
    dis4(\ff e8) r |
    R1*2/4 |
    c8\p c c c |
    \mBreak
    
    %p1 9
    h2 |
    dis4(\ff e8) r |
    R1*2/4 |
    c8\p c c c |
    \repeat volta 2 {
      h4 r |
      R1*2/4*7 |
    }
    \repeat volta 2 {
      R1*2/4*8 |
    }
    \mBreak
    
    %p10
    R1*2/4*7
    \mBreak
  }
}


% ---------------------------------------------------------

\bookpart {
  \header{
    instrument = "Klarinette I in A"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      <<
      {
        \transpose a a \clarinet_I
      }
      \\
      {
        \transpose a a \clarinet_II
      }
      >>
    }
  }
}

%{
\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b a \clarinet_I
      }
    }
  }
}


\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b a \clarinet_II
      }
    }
  }
}
%}
