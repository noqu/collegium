\version "2.24.1"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
    % Avoid subsitution of "Nr." by a typographic sign
    #(add-text-replacements!
    `(("Nr." . ,(format #f "N~ar." (ly:wide-char->utf-8 #x200C)))))
}

\header {
  title = "Sinfonie Nr. 6 h-Moll op.74 \"Pathetique\""
  subtitle = "I"
  composerShort = "Pjotr Iljitsch Tschaikowsky"
  composer = "Pjotr Iljitsch Tschaikowsky (1840 - 1893)"
  version = "v1"
}

% Adapt this for automatic line-breaks
% mBreak = {}
% pBreak = {}
mBreak = { \break }
pBreak = { \pageBreak }
#(set-global-staff-size 18)

% Just to make it easier to add rehearsal marks
rMark = { \mark \default }

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
espress = _\markup { \italic "espress." }
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
  markup-system-spacing.basic-distance = #4
  markup-system-spacing.minimum-distance = #4
  markup-system-spacing.padding = #4
  % Distance between music systems
  system-system-spacing.basic-distance = #13
  system-system-spacing.minimum-distance = #13
  % system-system-spacing.padding = #10
  }

\layout {
  \context {
    \Staff
    % This allows the use of \startMeasureCount and \stopMeasureCount
    % See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
    \consists #Measure_counter_engraver
    % \RemoveAllEmptyStaves
  }
}

% ---------------------------------------------------------

tschaikowsky_I_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Adagio"
  \key f \major
  \clef violin
  \relative c' {
    % cl2 p1 1
    R1*9 |
    % FIXME: Cues
    R1 |
    R1 |
    R1 |
    R1 |
    r2 r4 d |
    g,2~ g8 r8 r4 |
    R1 |
    R1 |
    R1\fermata |
    \mBreak
    
    % cl2 p1 19
    \tempo "Allegro non troppo"
    R1*4 |
    % FIXME: Cues
    r2 r4 f8 g |
    gis4 a8 r r4 f16 e f g |
    gis4 a8 r r4 r8 e' |
    r8 f r b, r c r a |
    \mBreak
    
    % cl2 p1 27
    r8 b r g8~ g r r4 |
    r4 r8 g8~ g b~ b r |
    R1 |
    \time 2/4
    R2 |
    \rMark
    \time 4/4
    % FIXME: Cues
    R1*18 |
    R1 |
    \mBreak
    
    % cl2 p1 50
    \rMark
    % FIXME: Cues
    R1 |
    R1 |
    R1 |
    R1 |
    r2 r16 g'' g g e e cis cis |
    h8 g fis r r16 c' c c c c a a |
    \mBreak
    
    % cl2 p1 56
    g8 e d r r16 d d d d h' g g |
    fis8 fis' ais, r r16 e' e e e e cis cis |
    h8 g fis r r2 |
    R1*3 |
    \mBreak
    
    % cl2 p1 62
    r2 r16 d' d d d d h h |
    \rMark
    a8 dis, cis r r16 g' g g g g e e |
    d8 h a r r16 d' d d d fis d d |
    \mBreak
    
    % cl2 p1 65
    cis8 g f r r16 h h h h h gis gis |
    fis8 d cis r r16 fis fis fis fis a gis fis |
    \tempo "Un poco animando"
    eis2 fis8 r r4 |
    r2 r16 a a a a c h a |
    \mBreak
    
    % cl2 p1 69
    gis2 a8 r r4 |
    r2 r4 r16 es'' d c |
    as16 g f es d c as g r4 r16 es'' d c |
    as16 g f es d c as g r4 c'16 es d c |
    \mBreak
    
    % cl2 p1 73
    \tempo "Un poco più animato"
    r4 c,16 es d c r4 c'16 es d c |
    r4 c,16 es d c fis,4 g8 r |
    fis4 g8 r dis4 e8 r |
    dis4 e8 r r2 |
    \mBreak
    
    % cl2 p1 77
    \rMark
    r2 e,4~ e8 r |
    e4~ e8 r r4 e~ |
    e4~ e8 r r4 e4~ |
    e8 r r4 r2 |
    R1*3 |
    R1*3 |
    R1 |
    R1\fermata |
    \mBreak
    \pBreak

    % cl2 p2 89
    \tempo "Andante"
    % FIXME: Cues
    R1 |
    R1 |
    R1 |
    r2 g |
    f8 r r4 fis2 |
    g2 e |
    f2 a'~ |
    a8 r r4 r2 |
    r2 fis, |
    g2 e |
    \mBreak
    
    % cl2 p2 99
    f2 a'~ |
    a8 r r4 r2 |
    \bar "||"
    \tempo "Moderato mosso"
    R1*5 |
    a,4~ \tuplet 3/2 { a8 h cis } \tuplet 3/2 { d d e } \tuplet 3/2 { f16 g a } \tuplet 3/2 { h c cis } |
    d8 r r4 r2 |
    R1 |
    \mBreak
    
    % cl2 p2 109
    \rMark
    R1*5 |
    e,,4~ \tuplet 3/2 { e8 fis gis } \tuplet 3/2 { a a h } \tuplet 3/2 { c16 d e } \tuplet 3/2 { fis g gis } |
    a8 r r4 r2 |
    R1 |
    \rMark
    d,4~ \tuplet 3/2 { d8 e fis } \tuplet 3/2 { g g a } \tuplet 3/2 { h c cis } |
    \mBreak
    
    % cl2 p2 118
    d4~ d16 h g d h8 r r4 |
    d4~ \tuplet 3/2 { d8 e fis } \tuplet 3/2 { g g a } \tuplet 3/2 { b c cis } |
    d4~ d16 b g d b8 r r4 |
    R1 |
    \mBreak
    
    % cl2 p2 122
    c'4~ c16 g f c g''4~ g16 c, g e |
    d2 \tuplet 6/4 { d16 e d e d cis } d8 r |
    r2 f'4~ f16 c f, c |
    r8 f'~16 c a c, r8 f'~ f16 c f, c |
    \mBreak
    
    % cl2 p2 126
    r8 b''~ b16 e, b e, r8 b''~ b16 e, b e, |
    r4 b' a g |
    f4 e2 d4 |
    des2 c4~ c8 r\fermata |
    \bar "||" 
    \mBreak
    
    % cl2 p2 130
    \tempo "Andante"
    \time 12/8
    r8 a a a a a a4.~ a8 r r |
    r8 f' f f f f r d d d d f |
    r8 f f f f f f r r r4 r8 |
    r8 c c c c c r g' g g g g |
    \mBreak
    
    % cl2 p2 134
    r8 a a a a r c2. |
    b8 b b b b b b2. |
    a8 a a a a a d,2. |
    c8 c c c c c e2.
    \mBreak
    
    % cl2 p2 138
    r8 a a a a r c2. |
    b8 b b b b b b2. |
    a8 a a a a a d,2. |
    c8 c c c c c e2.
    \mBreak
    
    % cl2 p2 142
    \tempo "Moderato assai"
    r8 f f f f f f4. fis |
    \time 4/4 
    fis4 g d e |
    e4 f f fis |
    g4 h d, e |
    \rMark
    f4 a f fis |
    fis g d e |
    \mBreak
    
    % cl2 p2 148
    e4 f f fis |
    g4 h d, e |
    f8 r r4 r2 |
    R1
    R1*2 |
    \tempo "Adagio mosso"
    R1*4 |
    % FIXME: Cues
    R1 |
    R1 |
    R1\fermata |
    \bar "||"
    \mBreak
    \pBreak
    
    % cl2 p3 161
    \mBreak
    
    % cl2 p3 165
    \mBreak
    
    % cl2 p3 169
    \mBreak
    
    % cl2 p3 174
    \mBreak
    
    % cl2 p3 181
    \mBreak
    
    % cl2 p3 186
    \mBreak
    
    % cl2 p3 189
    \mBreak
    
    % cl2 p3 191
    \mBreak
    
    % cl2 p3 193
    \mBreak
    
    % cl2 p3 195
    \mBreak
    
    % cl2 p3 197
    \mBreak
    \pBreak
  }
}

% ---------------------------------------------------------

\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \score {
    \new Staff {
      \transpose a a \tschaikowsky_I_clarinet_II
    }
  }
}
