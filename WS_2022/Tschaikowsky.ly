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
  title = "Sinfonie Nr.2 c-moll"
  subtitle = ""
  composerShort = "Pjotr Iljitsch Tschaikowsky"
  composer = "Pjotr Iljitsch Tschaikowsky (1840 - 1893)"
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
  \time 2/4
  \tempo "Moderato assai."
  \key c \major
  \clef violin
  \relative c' {
    % p1 1
    g''4\ff r |
    h4 r |
    c2~ |
    c4 r\fermata |
    c4 c |
    c4 r\fermata |
    g4 h |
    h4 d |
    c4 h |
    \mBreak
    
    % p1 2
    a4 a |
    cis4 d |
    a4 a |
    a4 d |
    a4 a |
    \repeat unfold 3 { c4 c } |
    c4 r |
    R2 |
    h4 r |
    R2 |
    R2\fermataMarkup |
    \bar "||"
    \mBreak
    
    % p1 3
    \tempo "Allegro vivo."
    R2*12 |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Viol.I"
        \stemUp {
          c,,8 r d r |
          e8 r f r |
          e8 g d4 |
          c8 a as g |
        }
      }
    >>
    r8 c\p r d |
    r8 e r f |
    r8 e r d |
    \mBreak
    
    % p1 4
    r8 c r d |
    r8 c r d |
    r8 e r f |
    r8 e r d |
    r8 c r c |
    R2*7 |
    r4 es'8(\f d) |
    c4\p d |
    \mBreak
    
    % p1 5
    e4 f |
    e8 g d4-> |
    c8 a g4-> |
    c4 d |
    e4 f |
    e8 g d4 |
    c8 a g r |
    R2 |
    r4 g'8\p g |
    a( g) a( fis) |
    \mBreak
    
    % p1 6
    g8 r c,4( |
    g8) r r4 |
    g'8( fis) fis4 |
    e4 fis8( h,) |
    es8( d) r4 |
    \mark #1
    R2*8 |
    c,4 d |
    e4 f |
    e8 c' d,4 |
    \mBreak
    
    % p1 7
    c8 e e,4 |
    c'4\< d |
    e4 f |
    e8 c' d,4 |
    c8 e e,4\! |
    c'''4\f c |
    c4 c |
    c4 h |
    a8 e d4 |
    c'4 c |
    \mBreak
    
    % p1 8
    c4 c |
    c4 h |
    a8 e d4 |
    \mark #2 |
    c4\mf d |
    e4 f |
    e8 g d4 |
    c8 c c4 |
    c4 d |
    e4 f |
    e8 g d4 |
    \mBreak
    
    %p1 9
    c8 r r4 |
    R2*8 |
    e8-.\p \repeat unfold 3 e-. |
    R2 |
    e8 e e e |
    R2 |
    \repeat unfold 2 { e8 e r4 } |
    es8\cresc es r4 |
    es8 es r4 |
    \mBreak
    
    % p1 10
    \repeat unfold 2 { g8 g r4 } |
    b8\f b r4 |
    b8 b r4 |
    \mark #3 |
    h8\ff r r4 |
    R2*7 |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Viol.I"
        \stemUp {
          c,,8 r d r |
          e8 r f r |
          e8 g d4 |
          c8 a g r |
        }
      }
    >>
    R2*4 |
    \mBreak
    
    % p1 11
    c'2\mf |
    c2 |
    c2 \cresc |
    c2 |
    g2 |
    as2 |
    g2 |
    as2 |
    g'2\f |
    as2 |
    g2 |
    as2 |
    g2\ff |
    as2 |
    \mBreak
    
    

    \bar "|."
  }
}

clarinet_II = {
  \set Score.markFormatter = #format-mark-alphabet
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 2/4
  \tempo "Moderato assai."
  \key c \major
  \clef violin
  \relative c' {
    % p1 1
    \mBreak
    \bar "|."
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
    instrument = "Klarinette I in C"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose c c \clarinet_I
      }
    }
  }
}


\bookpart {
  \header{
    instrument = "Klarinette II in C"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose c c \clarinet_II
      }
    }
  }
}
