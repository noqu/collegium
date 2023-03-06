\version "2.24.0"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
}

\header{
  title = "Carmina Burana"
  composerShort = "Carl Orff"
  composer = "Carl Orff (1895 - 1982)"
  version = "v0"
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
sempreFff = _\markup { \italic "sempre" \dynamic fff }
pocoF = _\markup { \italic "poco" \dynamic f }
ffz = _\markup { \dynamic { ffz } } 
crescMolto = _\markup { \italic "cresc. molto" }
pMoltoCresc = _\markup { \dynamic p \italic "molto cresc." }
sempreCresc = _\markup { \italic "sempre cresc." }
ppEspr = _\markup { \dynamic pp \italic "espr." }
ppDolcissimo = _\markup { \dynamic pp \italic "dolcissimo" }
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
  % markup-system-spacing.basic-distance = #12
  % markup-system-spacing.minimum-distance = #12
  % markup-system-spacing.padding = #10
  % Distance between music systems
  % system-system-spacing.basic-distance = #13
  % system-system-spacing.minimum-distance = #13
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

swaz_hie_gat_umbe_clarinet_I_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-circle-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 3/4
  \tempo "Allegro molto."
  \key c \major
  \clef violin
  \relative c' {
    R1*3/4*24 |
    \bar "||"
    g''4->-.\ff g8[-> f]-. e-. f-. |
    \repeat unfold 3 {
      g8(-> a-.) g[-. f]-. e-. f-. |
    }
    \repeat unfold 2 {
      g8(-> c-.) g[-. f]-. e-. f-. |
    }
    g8( c-.) g[-. f]-. e-. f-. |
    g8(-> c-.) g[-. f]-. e-. d-. |
    c4->-. c'->-. r |
    \bar "|."
  }
}

olim_lacus_colueram_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-circle-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key c \major
  \clef violin
  \relative c' {
    R1*3 |
    <<
      \new Voice {
        \voiceOne
        \override MultiMeasureRest.staff-position = #2
        R1*3 |
        % \clef violin
        r4 e''8->-.\f r r2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \voiceTwo
        \set instrumentCueName = "Fag.I"
        % \clef tenor
        {
          f,,8(-> e)-. r dis-. r e-. f8[(-> e)]-. |
          f8(-> e)-. dis(-> e-.) h(-> c-.) \tuplet 3/2 { gis-> a-.-- c-.-- }
          % \clef bass 
          e,1~\sf\>
          e8-.\! \hideNotes{ r r4 r2 } |
        }
      }
    >>
    \bar ".|:"
    f'4->\pp f-> f-> f-> |
    \repeat unfold 6 {
      f4-> f-> f-> f-> |
    }
    \bar "||"
    R1*4 |
    \tuplet 3/2 { r8 e''8-.\ff\> e-. } \repeat unfold 3 { \tuplet 3/2 { e-. e-. e-. } } |
    e8-. e-. r e-. r e-. e-. e-. |
    r4 e-. r e8-. e-.\pp |
    R1\fermata |
    \bar ":|."
  }
}

olim_lacus_colueram_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-circle-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key c \major
  \clef violin
  \relative c' {
    R1*3 |
    <<
      \new Voice {
        \voiceOne
        \override MultiMeasureRest.staff-position = #2
        R1*3 |
        % \clef violin
        r4 a''8->-.\f r r2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \voiceTwo
        \set instrumentCueName = "Fag.I"
        % \clef tenor
        {
          f,8(-> e)-. r dis-. r e-. f8[(-> e)]-. |
          f8(-> e)-. dis(-> e-.) h(-> c-.) \tuplet 3/2 { gis-> a-.-- c-.-- }
          % \clef bass 
          e,1~\sf\>
          e8-.\! \hideNotes{ r r4 r2 } |
        }
      }
    >>
    \bar ".|:"
    e'8(\pp a,)---. e'([ a,---.]) e'( a,---.) e'([ a,---.]) |
    \repeat unfold 6 {
      e'( a,---.) e'([ a,---.]) e'( a,---.) e'([ a,---.]) |
    }
    \bar "||"
    R1*4 |
    \tuplet 3/2 { r8 a''8-.\ff\> a-. } \repeat unfold 3 { \tuplet 3/2 { a-. a-. a-. } } |
    a8-. a-. r a-. r a-. a-. a-. |
    r4 a-. r a8-. a-.\pp |
    R1\fermata |
    \bar ":|."
  }
}

amor_volat_undique_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-circle-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key f \major
  \clef violin
  \relative c' {
    R1*24 |
    \time 3/4
    a'16(->\ppDolcissimo b a b c2)-- |
    b16(-> a c b a2)-- |
    a16(-> b a b c8-- c-- b-- b)-- |
    c16(-> b a g << a2)\fermata { s4\> s4\! } >> |
    R1*3/4*31 |
    a16(->\ppDolcissimo b a b c2)-- |
    b16(-> a c b a2)-- |
    a16(-> b a b c8-- c-- b-- b)-- |
    c16(-> b a g << a2)\fermata { s4\> s4\! } >> |
    \bar "|."
  }
}

amor_volat_undique_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-circle-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key f \major
  \clef violin
  \relative c' {
    R1*24 |
    \time 3/4
    f16(->\ppDolcissimo g f g a2)-- |
    g16(-> f a g f2)-- |
    f16(-> g f g a8-- a-- g-- g)-- |
    a16(-> g f e << f2)\fermata { s4\> s4\! } >> |
    R1*3/4*31 |
    f16(->\ppDolcissimo g f g a2)-- |
    g16(-> f a g f2)-- |
    f16(-> g f g a8-- a-- g-- g)-- |
    a16(-> g f e << f2)\fermata { s4\> s4\! } >> |
    \bar "|."
  }
}

stetit_puella_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-circle-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key c \major
  \clef violin
  \relative c' {
    R1*16 |
    c''4(\ppDolcissimo h a2~ |
    a4 c h a |
    h4 \tuplet 3/2 { a8 h a } g2~ |
    g2)\breathe e4(\< f |
    g2)\!\breathe e4(\< f |
    g2)\!\breathe e4(\< f |
    g4 a\> g f |
    g2--\! g)-- |
    R1*18 |
    c4(\ppDolcissimo h a2~ |
    a4 c h a |
    h4 \tuplet 3/2 { a8 h a } g2~ |
    g2)\breathe e4(\< f |
    g2)\!\breathe e4(\< f |
    g2)\!\breathe e4(\< f |
    g4 a\> g f |
    g2--\! g)-- |
    R1*2 |
    \bar "|."
  }
}

stetit_puella_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-circle-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key c \major
  \clef violin
  \relative c' {
    R1*16 |
    a''4(\ppDolcissimo g f2~ |
    f4 a g f |
    g4 \tuplet 3/2 { f8 g f } e2~ |
    e2)\breathe c4(\< d |
    e2)\!\breathe c4(\< d |
    e2)\!\breathe c4(\< d |
    e4 f\> e d |
    e2--\! e)-- |
    R1*18 |
    a4(\ppDolcissimo g f2~ |
    f4 a g f |
    g4 \tuplet 3/2 { f8 g f } e2~ |
    e2)\breathe c4(\< d |
    e2)\!\breathe c4(\< d |
    e2)\!\breathe c4(\< d |
    e4 f\> e d |
    e2--\! e)-- |
    R1*2 |
    \bar "|."
  }
}


% ---------------------------------------------------------

\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \header {
      piece = \markup { \fontsize #3 \bold "Swaz hie gat umbe" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \swaz_hie_gat_umbe_clarinet_I_II
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #3 \bold "Olim lacus colueram" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \olim_lacus_colueram_clarinet_I
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #3 \bold "Amor volat undique" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \amor_volat_undique_clarinet_I
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #3 \bold "Stetit puella" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \stetit_puella_clarinet_I
      }
    }
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \header {
      piece = \markup { \fontsize #3 \bold "Swaz hie gat umbe" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \swaz_hie_gat_umbe_clarinet_I_II
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #3 \bold "Olim lacus colueram" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \olim_lacus_colueram_clarinet_II
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #3 \bold "Amor volat undique" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \amor_volat_undique_clarinet_II
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #3 \bold "Stetit puella" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \stetit_puella_clarinet_II
      }
    }
  }
}

