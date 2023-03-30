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
aTempoComePrima = ^\markup { \italic {"a tempo come prima"} }
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
attaca = ^\markup { \bold { "attaca" } }

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

% Do not print bar numbers at all
\layout {
  \context {
    \Score
    \omit BarNumber
  }
}

% ---------------------------------------------------------

nine_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 2/4
  \key c \major
  \clef violin
  \relative c' {
    R1*2/4 |
    \break
    \autoLineBreaksOff
    <<
      \new Voice {
        \override MultiMeasureRest.staff-position = #-4
        R1*2/4*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Coro"
        \voiceOne
        \autoBeamOff
        \time 2/4
        a''8\fermata g->\pocoRit f-> e-> |
        d4-> d-> |
        \autoBeamOn
      } \addlyrics { ""8 le di -- sen su4 -- mer }
    >>
    \time 3/4
    \bar "||"
    \mark #69
    \tempo "a tempo" 2.=84
    g4->-.\ff g8[-> f]-. e-. f-. |
    \repeat unfold 3 {
      g8(-> a-.) g[-. f]-. e-. f-. |
    }
    \break
    \repeat unfold 2 {
      g8(-> c-.) g[-. f]-. e-. f-. |
    }
    g8( c-.) g[-. f]-. e-. f-. |
    g8(-> c-.) g[-. f]-. e-. d-. |
    c4->-. c'->-. r\attaca |
    \bar "|."
    \break
    R1*3/4
    \break
    \time 1/4
    <<
      \new Voice {
        \override MultiMeasureRest.staff-position = #-4
        R1*1/4 |
        \mark #77
        \time 3/4
        R1*3/4*3 |
        \time 2/4
        R1*2/4*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \voiceOne
        \set instrumentCueName = "Oboe"
        <e, g>4 |
        \time 3/4
        \repeat unfold 3 {
          r4 <c e g> r |
        }
        \time 2/4
                
        \set instrumentCueName = "Coro"
        \autoBeamOff
          a'8\fermata g->\pocoRit f-> e-> |
          d4-> d-> |
        
        \autoBeamOn
      } \addlyrics { ""4 ""2. ""2. ""2. ""8 le di -- sen su4 -- mer }
    >>
    \time 3/4
    \bar "||"
    \tempo "a tempo" 2.=84
    g4->-.\ff g8[-> f]-. e-. f-. |
    \break
    \repeat unfold 3 {
      g8(-> a-.) g[-. f]-. e-. f-. |
    }
    g8(-> c-.) g[-. f]-. e-. f-. |
    \mark #78
    g8(-> c-.) g[-. f]-. e-. f-. |
    g8( c-.) g[-. f]-. e-. f-. |
    g8(-> c-.) g[-. f]-. e-. d-. |
    c4->-. c'->-. r\attaca |
    \bar "|."
    \autoLineBreaksOn
  }
  
}

nine_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 2/4
  \key c \major
  \clef violin
  \relative c' {
    R1*2/4 |
    \break
    <<
      \new Voice {
        \override MultiMeasureRest.staff-position = #-4
        R1*2/4*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Coro"
        \voiceOne
        \autoBeamOff
        \time 2/4
        a''8\fermata g->\pocoRit f-> e-> |
        d4-> d-> |
        \autoBeamOn
      } \addlyrics { ""8 le di -- sen su4 -- mer }
    >>
    \time 3/4
    \bar "||"
    \mark #69
    \tempo "a tempo" 2.=84
    g4->-.\ff g8[-> f]-. e-. f-. |
    \repeat unfold 3 {
      g8(-> a-.) g[-. f]-. e-. f-. |
    }
    \break
    \repeat unfold 2 {
      g8(-> c-.) g[-. f]-. e-. f-. |
    }
    g8( c-.) g[-. f]-. e-. f-. |
    g8(-> c-.) g[-. f]-. e-. d-. |
    c4->-. c'->-. r\attaca |
    \bar "|."
    \break
    R1*3/4
    \break
    \tempo "allegro molto" 2.=84
    g4->-.\ff g8[-> f]-. e-. f-. |
    \repeat unfold 3 {
      g8(-> a-.) g[-. f]-. e-. f-. |
    }
    \break
    g8(-> c-.) g[-. f]-. e-. f-. |
    \mark #78
    g8(-> c-.) g[-. f]-. e-. f-. |
    g8( c-.) g[-. f]-. e-. f-. |
    g8(-> c-.) g[-. f]-. e-. d-. |
    c4->-. c'->-. r\attaca |
    \bar "|."
  }
}

twelve_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \tempo "" 4 = 84
  \key c \major
  \clef violin
  \relative c' {
    R1*2 |
    \mark #89
    R1
    <<
      \new Voice {
        \voiceOne
        \override MultiMeasureRest.staff-position = #2
        R1*3 |
        % \clef violin
        r4 e''8->-.\f r r2 |
        \break
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \voiceTwo
        \set instrumentCueName = "Fag.I"
        % \clef tenor
        {
          f,,8(-> e)-. r dis-. r e-. f8[(-> e)]-. |
          f8(-> e)-. dis(-> e-.) h(-> c-.) \tuplet 3/2 { gis->\rit a-.-- c-.-- }
          % \clef bass 
          e,1~\sf\>\aTempo
          e8-.\! \hideNotes{ r r4 r2 } |
        }
      }
    >>
    \bar ".|:"
    \tempo "" 4 = 44
    f'4->\pp f-> f-> f-> |
    \repeat unfold 4 {
      f4-> f-> f-> f-> |
    }
    \mark #90
    \repeat unfold 2 {
      f4-> f-> f-> f-> |
    }
    \bar "||"
    \break
    \time 4/2
    \tempo "" 4 = 132
    R1*4/2*3 |
    \time 4/4
    \tuplet 3/2 { r8 e''8-.\ff\>^\markup\italic {"staccatissimo"} e-. } \repeat unfold 2 { \tuplet 3/2 { e-. e-. e-. } } \tuplet 3/2 { e-.\string e-. e-. } |
    e8-. e-. r e-. r e-.^\markup\italic{"(senza rit.)"} e-. e-. |
    r4 e-. r e8-. e-.\pp |
    R1\fermata\attaca_\markup\bold {"3 Strophen"} |
    \bar ":|."
  }
}

twelve_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \tempo "" 4 = 84
  \key c \major
  \clef violin
  \relative c' {
    R1*2 |
    \mark #89
    R1
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
          f8(-> e)-. dis(-> e-.) h(-> c-.) \tuplet 3/2 { gis->\rit a-.-- c-.-- }
          % \clef bass 
          e,1~\sf\>\aTempo
          e8-.\! \hideNotes{ r r4 r2 } |
        }
      }
    >>
    \bar ".|:"
    \break
    \tempo "" 4 = 44
    e'8(\pp a,)---. e'([ a,---.]) e'( a,---.) e'([ a,---.]) |
    \repeat unfold 4 {
      e'( a,---.) e'([ a,---.]) e'( a,---.) e'([ a,---.]) |
    }
    \mark #90
    \repeat unfold 2 {
      e'( a,---.) e'([ a,---.]) e'( a,---.) e'([ a,---.]) |
    }
    \bar "||"
    \time 4/2
    \tempo "" 4 = 132
    R1*4/2*3 |
    \time 4/4
    \tuplet 3/2 { r8 a''8-.\ff\>^\markup\italic {"staccatissimo"} a-. } \repeat unfold 2 { \tuplet 3/2 { a-. a-. a-. } } \tuplet 3/2 { a-.\string a-. a-. } |
    a8-. a-. r a-. r a-.^\markup\italic{"(senza rit.)"} a-. a-. |
    r4 a-. r a8-. a-.\pp |
    R1\fermata\attaca_\markup\bold {"3 Strophen"} |
    \bar ":|."
  }
}

fifteen_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key f \major
  \clef violin
  \relative c' {
    R1 |
    \break
    \time 3/4
    a'16(->\ppDolcissimo\aTempoComePrima b a b c2)-- |
    b16(-> a c b a2)-- |
    a16(-> b a b c8-- c-- b-- b)-- |
    c16(->^\markup\italic "pochissimo rit." b a g a2)\fermata |
    \break
    R1*3/4 |
    \break
    \time 3/4
    a16(->\ppDolcissimo\aTempo b a b c2)-- |
    b16(-> a c b a2)-- |
    a16(-> b a b c8-- c-- b-- b)-- |
    c16(->^\markup\italic "poch. rit." b a g a2)\fermata\attaca |
    \bar "|."
  }
}

fifteen_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key f \major
  \clef violin
  \relative c' {
    R1 |
    \break
    \tempo "" 4 = 112
    R1
    \mark #105
    R1\fermata
    \time 3/4
    f16(->\ppDolcissimo\aTempoComePrima g f g a2)-- |
    g16(-> f a g f2)-- |
    f16(-> g f g a8-- a-- g-- g)-- |
    a16(->^\markup\italic "pochissimo rit." g f e << f2)\fermata { s4\> s4\! } >> |
    \break
    R1*3/4 |
    \break
    \time 3/4
    f16(->\ppDolcissimo\aTempoComePrima g f g a2)-- |
    g16(-> f a g f2)-- |
    f16(-> g f g a8-- a-- g-- g)-- |
    a16(->^\markup\italic "poch. rit." g f e << f2)\fermata\attaca { s4\> s4\! } >> |
    \bar "|."
  }
}

seventeen_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key c \major
  \clef violin
  \relative c' {
    R1 |
    \break
    R1*5 |
    \mark #114
    R1*3
    R1\pocoRit\breathe
    c''4(\ppDolcissimo\aTempo h a2~ |
    a4 c h a |
    h4 \tuplet 3/2 { a8 h a } g2~ |
    g2)\breathe e4(\< f |
    \break
    g2)\!\breathe e4(\< f |
    g2)\!\breathe e4(\< f |
    \mark #115
    g4 a\> g f |
    g2--\! g)-- |
    R1*2 |
    \bar "||"
    R1*6\aTempo
    \mark #116
    R1*8 |
    \break
    <<
      \new Voice {
        \voiceOne
        \override MultiMeasureRest.staff-position = #-10
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \voiceTwo
        \set instrumentCueName = "Viol.I div."
        {
          <fis, a e' h'>8 <fis a e' h'>4 <fis a e' h'>8 <fis a e' h'>4 <fis a e' h'> |
          <fis a e' h'>8 <fis a e' h'>4 <fis a e' h'>8 <fis a e' h'>4 <fis a e' h'> |
        }
      }
    >>
    \mark #117
    \breathe
    c''4(\aTempo\ppDolcissimo h a2~ |
    a4 c h a |
    h4 \tuplet 3/2 { a8 h a } g2~ |
    g2)\breathe e4(\< f |
    \break
    g2)\!\breathe e4(\< f |
    g2)\!\breathe e4(\< f |
    g4 a\> g f |
    g2--\! g)-- |
    R1*2\attaca |
    \bar "|."
  }
}

seventeen_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressEmptyMeasures
  \defaultTimeSignature
  \time 4/4
  \key c \major
  \clef violin
  \relative c' {
    R1 |
    \break
    R1*5 |
    \mark #114
    R1*3
    R1\pocoRit\breathe
    a''4(\ppDolcissimo\aTempo g f2~ |
    f4 a g f |
    g4 \tuplet 3/2 { f8 g f } e2~ |
    e2)\breathe c4(\< d |
    \break
    e2)\!\breathe c4(\< d |
    e2)\!\breathe c4(\< d |
    \mark #115
    e4 f\> e d |
    e2--\! e)-- |
    R1*2 |
    \bar "||"
    R1*6\aTempo
    \mark #116
    R1*8 |
    \break
    <<
      \new Voice {
        \voiceOne
        \override MultiMeasureRest.staff-position = #-10
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \voiceTwo
        \set instrumentCueName = "Viol.I div."
        {
          <fis, a e' h'>8 <fis a e' h'>4 <fis a e' h'>8 <fis a e' h'>4 <fis a e' h'> |
          <fis a e' h'>8 <fis a e' h'>4 <fis a e' h'>8 <fis a e' h'>4 <fis a e' h'> |
        }
      }
    >>
    \mark #117
    \breathe
    a'4(\ppDolcissimo\aTempo g f2~ |
    f4 a g f |
    g4 \tuplet 3/2 { f8 g f } e2~ |
    e2)\breathe c4(\< d |
    \break
    e2)\!\breathe c4(\< d |
    e2)\!\breathe c4(\< d |
    e4 f\> e d |
    e2--\! e)-- |
    R1*2\attaca |
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
      piece = \markup { \fontsize #5 \bold "Nr. 9" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \nine_clarinet_I
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #5 \bold "Nr. 12" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \twelve_clarinet_I
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #5 \bold "Nr. 15" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \fifteen_clarinet_I
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #5 \bold "Nr. 17" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \seventeen_clarinet_I
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
      piece = \markup { \fontsize #5 \bold "Nr. 9" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \nine_clarinet_II
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #5 \bold "Nr. 12" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \twelve_clarinet_II
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #5 \bold "Nr. 15" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \fifteen_clarinet_II
      }
    }
  }
  \score {
    \header{
      piece = \markup { \fontsize #5 \bold "Nr. 17" }
    }
    \new Staff {
      \new Voice {
        \transpose b a \seventeen_clarinet_II
      }
    }
  }
}

