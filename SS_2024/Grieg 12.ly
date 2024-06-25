\version "2.24.1"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
}

\header{
  title = "12 Solvejgs Wiegenlied"
  subtitle = "Peer Gynt"
  composerShort = "Edvard Grieg"
  composer = "Edvard Grieg (1843 - 1907)"
  version = "v2"
}

% Adapt this for automatic line-breaks
% mBreak = {}
% pBreak = {}
mBreak = { \break }
pBreak = { \pageBreak }
#(set-global-staff-size 18)

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
fCantabile = _\markup { \dynamic f \italic "cantabile" }
smorz = _\markup { \italic "smorz." }
sempreFf = _\markup { \italic "sempre" \dynamic ff }
ffSempre = _\markup { \dynamic ff \italic "sempre" }
sempreFff = _\markup { \italic "sempre" \dynamic fff }
pocoF = _\markup { \italic "poco" \dynamic f }
ffz = _\markup { \dynamic { ffz } } 
ffp = _\markup { \dynamic { ffp } } 
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
    \if \should-print-page-number \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \if \should-print-page-number \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "     -     "
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
  oddFooterMarkup = \markup
  \fill-line \fontsize #-2.0 {
    " "
    \fromproperty #'header:version
    " "
  }
  % Distance between title stuff and music
  markup-system-spacing.basic-distance = #12
  markup-system-spacing.minimum-distance = #12
  markup-system-spacing.padding = #10
  % Distance between music systems
  system-system-spacing.basic-distance = #13
  system-system-spacing.minimum-distance = #13
  % system-system-spacing.padding = #10
  
}

% This allows the use of \startMeasureCount and \stopMeasureCount
% See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
\layout {
  \context {
    \Staff
    \consists #Measure_counter_engraver
  }
}

% ---------------------------------------------------------

clarinet_I = {
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/2
  \tempo "Lento."
  \key e \major
  \clef violin
  \relative c' {
    % cl1 p1 1
    R1*8 |
    \mark #1
    R1*8 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose b c \relative {
        \stemUp
        a''4.^"Solvejg" a8 a4 h8 cis |
        h4 a a2 |
        \stemNeutral
      }
    >>
    a'2(\pp\< gis2)\> |
    R1*2\! |
    \mBreak

    % cl1 p1 2
    e2(\pp\< dis2)\> |
    R1*2\! |
    a'2(\< gis2)\> |
    R1*2\! |
    e2(\< dis2)\> |
    \mBreak

    % cl1 p2 1
    \mark #2
    R1*8\! |
    \mark #3
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose b c \relative {
        \stemUp
        a''4.^"Solvejg" a8 a4 h8 cis |
        h4 a a2 |
        \stemNeutral
      }
    >>
    R1*4 |
    \mBreak

    % cl1 p2 2
    R1*2 |
    \mark #4
    d'2\pp r |
    fis2 r |
    d2 r |
    fis2 r |
    d2 r |
    \mBreak

    % cl1 p3 1
    h2 r |
    g2 r |
    e2 r |
    fis2 r |
    fis2\> r |
    fis2 r |
    fis2 r\! |
    \mBreak

    % cl1 p3 2
    R1*5 |
    R1\fermata |
    e'2(\pp\< dis |
    d) cis4(\> c)\! |
    h2( ais)\<\rit |
    a1->\p\> |
    \after 4\< \after 2\f \after 2.\> \after 1\! gis1\pp\fermata
    \bar "|."
    \mBreak
  }
}

clarinet_II = {
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/2
  \tempo "Lento."
  \key e \major
  \clef violin
  \relative c' {
    % cl2 p1 1
    R1*8 |
    \mark #1
    R1*8 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose b c \relative {
        \stemUp
        a''4.^"Solvejg" a8 a4 h8 cis |
        h4 a a2 |
        \stemNeutral
      }
    >>
    dis2(\pp\< e2)\> |
    R1*2\! |
    \mBreak

    % cl2 p1 2
    ais,2(\pp\< h2)\> |
    R1*2\! |
    dis2(\< e2)\> |
    R1*2\! |
    ais,2(\< h2)\> |
    \mBreak

    % cl2 p2 1
    \mark #2
    R1*8\! |
    \mark #3
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1 |
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose b c \relative {
        \stemUp
        a''4.^"Solvejg" a8 a4 h8 cis |
        h4 a a2 |
        \stemNeutral
      }
    >>
    R1*4 |
    \mBreak

    % cl2 p2 2
    R1*2 |
    \mark #4
    g'2\pp r |
    h2 r |
    g2 r |
    h2 r |
    g2 r |
    \mBreak

    % cl2 p3 1
    e2 r |
    cis2 r |
    ais2 r |
    h2 r |
    h2\> r |
    h2 r |
    h2 r\! |
    \mBreak

    % cl2 p3 2
    R1*5 |
    R1\fermata |
    gis'1~\pp\< |
    gis2 g4(\> fis)\! |
    \after 2\< \after 2\rit e1 |
    dis1->\p\> |
    \after 4\< \after 2\f \after 2.\> \after 1\! e1\pp\fermata
    \bar "|."
    \mBreak
  }
}



% ---------------------------------------------------------

%{
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
%}

\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b b \clarinet_I
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
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b b \clarinet_II
      }
    }
  }
}
