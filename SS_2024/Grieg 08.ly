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
  title = "08 Solvejgs Lied"
  subtitle = "Peer Gynt"
  composerShort = "Edvard Grieg"
  composer = "Edvard Grieg (1843 - 1907)"
  version = "v1"
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
  \time 4/4
  \tempo "Poco Andante."
  \key es \major
  \clef violin
  \relative c' {
    % cl1 p1 1
    R1*6 |
    r2\fermata r4\fermata r |
    \bar "||"
    R1*5 |
    es'2~\p es4 r |
    R1*3 |
    g2~ g4 r |
    \mark #1 |
    R1*3\pocoRit |
    r2\aTempo r4 g,4\f |
    \mBreak

    % cl1 p1 2
    c2->~ c4 r |
    R1 |
    r2 r4\fermata r\fermata |
    \bar "||"
    \key c \major
    \time 3/4
    \tempo "Allegretto tranquillamente."
    r4 r g->\pp~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    \mBreak

    % cl1 p1 3
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 r4 |
    R2. |
    \bar "||"
    \time 4/4
    \tempo "Andante. (Tempo 1)" 
    r2 g4(\pp a |
    g4) r\fermata r\fermata r |
    \bar "||"
    \key es \major
    R1*5 |
    \mBreak

    % cl1 p1 4
    es'2\p~ es4 r |
    R1*3 |
    g2~ g4 r |
    \mark #2 |
    R1*3\pocoRit |
    r2\aTempo r4 g\f |
    c2->~ c4 r |
    R1 |
    r2 r4\fermata r\fermata |
    \bar "||"
    \key c \major
    \time 3/4
    \mBreak

    % cl1 p1 5
    \tempo "Allegretto tranquillamente."
    r4 r g->\pp~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    g2 g4->~ |
    \mBreak

    % cl1 p1 6
    g2 g4->~ |
    g2 g4->~ |
    g2 r4 |
    R2.
    \bar "||"
    \time 4/4
    \tempo "Andante. (Tempo 1)" 
    r2 c2\pp~ |
    c4 r4\fermata r\fermata r 
    \bar "||"
    \key es \major
    R1*6 |
    R1\fermata
    \bar "|."
    \mBreak
  }
}

clarinet_II = {
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Poco Andante."
  \key es \major
  \clef violin
  \relative c' {
    % cl2 p1 1
    R1*6 |
    r2\fermata r4\fermata r |
    \bar "||"
    R1*5 |
    c'2~\p c4 r |
    R1*3 |
    es2~ es4 r |
    \mark #1 |
    R1*3\pocoRit |
    r2\aTempo r4 g,4\f |
    \mBreak

    % cl2 p1 2
    c2->~ c4 r |
    R1 |
    r2 r4\fermata r\fermata |
    \bar "||"
    \key c \major
    \time 3/4
    \tempo "Allegretto tranquillamente."
    R1*12 
    \bar "||"
    \time 4/4
    \tempo "Andante. (Tempo 1)" 
    r2 c,2~\pp |
    c4 r\fermata r\fermata r |
    \bar "||"
    \mBreak

    % cl2 p1 3
    \key es \major
    R1*5 |
    c'2\p~ c4 r |
    R1*3 |
    es2~ es4 r |
    \mark #2 |
    R1*3\rit |
    r2\aTempo r4 g\f |
    c2->~ c4 r |
    R1 |
    r2 r4\fermata r\fermata |
    \bar "||"
    \mBreak

    % cl2 p1 4
    \key c \major
    \time 3/4
    \tempo "Allegretto tranquillamente."
    \pocoRit
    R2.*12 |
    \bar "||"
    \time 4/4
    \tempo "Andante. (Tempo 1)" 
    r2 g4(\pp a |
    g4) r4\fermata r\fermata r 
    \bar "||"
    \key es \major
    R1*6 |
    R1\fermata
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
    instrument = "Klarinette I in A"
  }
  \score {
    \new Staff {
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose a a \clarinet_I
      }
    }
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \score {
    \new Staff {
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose a a \clarinet_II
      }
    }
  }
}
