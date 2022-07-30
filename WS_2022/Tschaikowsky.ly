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
  \set Score.markFormatter = #format-mark-alphabet
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 2/4
  \tempo "Moderato assai."
  \key c \major
  \clef violin
  \relative c' {
    % cl1 p1 1
    g''4\ff r |
    h4 r |
    c2~ |
    c4 r\fermata |
    g4 h4 |
    c4 c |
    c2 ~ |
    c4 r\fermata |
    g4 h |
    h4 d |
    c4 h |
    \mBreak
    
    % cl1 p1 2
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
    
    % cl1 p1 3
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
    
    % cl1 p1 4
    r8 c r d |
    r8 c r d |
    r8 e r f |
    r8 e r d |
    r8 c r c |
    R2*7 |
    r4 es'8(\f d) |
    c4\p d |
    \mBreak
    
    % cl1 p1 5
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
    
    % cl1 p1 6
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
    
    % cl1 p1 7
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
    
    % cl1 p1 8
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
    
    % cl1 p1 10
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
    
    % cl1 p1 11
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
    \pBreak
    
    % cl1 p2 1
    g2 |
    as2 |
    e4\ff g |
    c2 |
    e,4 g |
    c2 |
    e,8 g c e, |
    c8 es as c, |
    e8 g c e, |
    c8 es as c, |
    \mBreak
    
    % cl1 p2 2
    e8 fis gis e |
    c8 d e c |
    e8 fis gis e |
    c8 d e4 |
    e8 g c4 |
    \repeat unfold 3 { e,8 g c4 }
    \mBreak
    
    % cl1 p2 3
    \mark 4 |
    r4 f, |
    g4 as |
    as4 as |
    c4 h |
    R2*2 |
    g4\ff h |
    c4 c |
    c8 c h4 |
    a8 e e4 |
    g4 h |
    c4 c |
    \mBreak
    
    % cl1 p2 4
    c8 c h4 |
    a8 e e4 |
    c'2 |
    \repeat unfold 3 c2 |
    \repeat unfold 3 { c4 r } |
    R2 |
    \repeat unfold 2 { c4 r } |
    \mBreak
    
    
    % cl1 p2 5
    c4 r |
    R2*5 |
    \mark 5 |
    R2*12 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Viol.I"
        \stemUp {
          f,,8 r f g~ |
          g4 f8( es |
          f8) as( b c |
          as8)
        }
        \set instrumentCueName = "Fl.I"
        \stemUp {
          es'([ as b]) |
        }
      }
    >>
    es,,8\mf e4. |
    e8 f4 g8 |
    \mBreak
    
    % cl1 p2 6
    as8 a4. |
    as8 b4. |
    b8 h4. |
    h8 c4. |
    des8 c4. |
    c8 h4 b8 |
    es,8 e4. |
    e8 f4 g8 |
    as8 a4. |
    a8 b4. |
    \mBreak
    
    % cl1 p2 7
    b8 h4. |
    h8 c4. |
    c8 des4. |
    \repeat unfold 2 {
      c8 r r4 |
      e2~ |
      e2~ |
      e4. d8 |
    }
    \mBreak
    
    % cl1 p2 8
    f8\f r r4 |
    \repeat unfold 2 {
      R2 |
      f8 r r4 |
    }
    r8 b,8\f as b |
    as8 r r4 |
    r8 b8\mf as b |
    g8 r r fes\p |
    \mBreak
    
    % cl1 p2 9
    as8 r r b |
    \mark 6
    as8 r r4 |
    R2*7 |
    r8 as r b |
    r8 c r des |
    r8 es r b |
    r8 c, r es |
    r8 as r b |
    \mBreak
    
    % cl1 p2 10
    r8 c r des |
    r8 es r b |
    r8 c, r es |
    R2 |
    r4 f'\ff |
    es4 es |
    f4 es |
    R2 |
    r4 f |
    es4 es |
    f4 es |
    \mBreak
    
    % cl1 p2 11
    c4 es |
    as2 |
    f4 es |
    f2 |
    ges4 as |
    b2 |
    c4 des |
    es4~ es8 r |
    r4 ces\ff~ |
    ces4 ces~ |
    ces4 ces~ |
    ces4 ces |
    R2*4 |
    \pBreak
    
    % cl1 p3 1
    \mark 7
    as4\ff b |
    c4 des |
    c8 es b4 |
    ces4 b |
    as4 b |
    c4 des |
    c8 es b4 |
    ces4 b |
    as4 b |
    r4 es, |
    r4 es |
    r4 es |
    \mBreak
    
    % cl1 p3 2
    r4 es |
    as,2~ |
    as2 |
    f,2~ |
    f2 |
    r4 es''4 |
    \repeat unfold 3 { r4 es } |
    as,2~ |
    as2 |
    fes,2~ |
    fes2 |
    \mBreak
    
    % cl1 p3 3
    cis'2~\f |
    cis 2 |
    R2*6 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Ob.I"
        \stemUp {
          des'8 r es r |
          f8 r ges r |
          f8 b es, r |
          d8 f ces r |
        }
      }
    >>
    b8\p r c r |
    d8 r es r |
    \mBreak
    
    % cl1 p3 4
    d8 g c, r |
    h8 d g, r |
    R2*4 |
    c8\p r d r |
    e8 r f r |
    e8 a d, r |
    cis8 e a, r |
    \mark 8
    fis2~\p |
    fis2 |
    \mBreak
    
    % cl1 p3 4
    g2~ |
    g2 |
    f2( |
    es2) |
    des2 |
    ces2 |
    b2 |
    b'2 |
    ces2~ |
    ces2 |
    a2 |
    g2 |
    f2 |
    es2 |
    R2*4 |
    \mBreak

    % cl1 p3 5
    g8\p r a r |
    h8 r c r |
    h8 e a, r |
    gis8 h e, r |
    R2*4 |
    a8 r h r |
    cis8 r d r |
    cis8 fis h, r |
    \mBreak
    
    % cl1 p3 6
    ais8 cis fis, r |
    dis2~\p |
    dis2 |
    e2~ |
    e2 |
    d2 |
    c2 |
    b2 |
    as2 |
    g2 |
    g'2\cresc |
    as2~ |
    as2 |
    \mBreak
    
    % cl1 p3 7
    fis2 |
    e2 |
    d2 |
    c2 |
    \mark 9
    h''8\f r h a |
    r4 g8 f |
    e8 r e d |
    r4 c8 h |
    e8 r c' h |
    r4 a8 g |
    \mBreak
    
    % cl1 p3 8
    fis8 r fis e |
    r4 d8 cis |
    d8 r e\cresc r |
    fis8 r g r |
    fis8 h e, r |
    dis8 fis h, r |
    g'8 r a r |
    h8 r c r |
    \mBreak
    
    % cl1 p3 9
    h8 e a, r |
    gis8 h e, r |
    c'8\ff r c d |
    r4 dis8 e |
    fis,8 r fis g |
    r4 gis8 ais |
    d8 r d cis |
    r4 gis8 fis |
    \pBreak
    
    % cl1 p4 1
    gis8 r gis fis |
    r4 e8 dis |
    e8 r fis r |
    gis8 r a r |
    gis8 cis fis, r |
    eis8 gis cis, r |
    a'8 r h r |
    cis8 r d r |
    \mBreak
    
    % cl1 p4 2
    cis8 ais h r |
    b8 cis g r |
    g4\ff r |
    h4 r |
    c4 r |
    h4 r |
    g4 r |
    h4 r |
    c4 r |
    h4 r |
    \mBreak
    
    % cl1 p4 3
    \mark 11
    g,4\sempreFf a |
    h4 c |
    h8 e a,4 |
    gis8 h f4 |
    e4 fis |
    gis4 a |
    gis8 cis fis,4 |
    eis8 gis cis,4 |
    a'4 h |
    cis4 d |
    \mBreak
    
    % cl1 p4 4
    cis8 fis h,4 |
    ais8 cis g4 |
    fis4 gis |
    ais4 h |
    ais8 dis gis,4 |
    % FIXME: really? why not just g?
    fisis8 ais dis,4 |
    as'4 b |
    c4 des |
    c8 f b,4 |
    a8 c f,4 |
    \mBreak
    
    % cl1 p4 5
    b4 c |
    d4 es |
    d8 g c,4 |
    h8 d g,4 |
    c8 d e g |
    a,8 h cis e |
    d8 e fis a |
    h, cis dis fis |
    e fis gis h |
    \mBreak
    
    % cl1 p4 6
    \repeat unfold 3 {
      cis,8 dis eis gis |
    }
    a,4 h |
    cis4 d |
    cis8 fis h,4 |
    ais8 cis fis,4 |
    d'4 e |
    fis g |
    \mBreak
    
    % cl1 p4 7
    fis8 h e,4 |
    dis8 fis dis4 |
    e8 r r4 |
    R2 |
    r4 g |
    e4 g |
    R2*2 |
    r4 g |
    e4 g |
    \mark 12
    c,,4\mf d |
    e4 f |
    \mBreak
    
    % cl1 p4 8
    e8 a d,4 |
    cis8 e a,4 |
    h4 cis |
    dis e |
    dis8 fis ais,4 |
    h8 dis g,4 |
    e'4\f fis |
    g4 as |
    g8 c f,4 |
    e8 g c,4 |
    \mBreak
    
    % cl1 p4 9
    d4 e |
    fis4 g |
    fis8 d' e,4 |
    d8 a' g4 |
    R2*2 |
    a4 h |
    cis4 d |
    f8 a e4 |
    dis8 fis h,4 |
    h4 cis |
    \mBreak
    
    % cl1 p4 10
    dis4 e |
    c4 d |
    e4 f |
    d4 e |
    fis4 g |
    h2\ff |
    c2 |
    cis2 |
    d2 |
    \mark13
    R2*16 |
    \pBreak
    
    % cl1 p5 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Viol.I"
        \stemUp {
          a,8 r a h~ |
          h4 a8 g |
          a8 c d e |
          c
        }
        \set instrumentCueName = "Fl.I"
        \stemUp {
          g'[ c d] |
        }
      }
    >>
    g,,8 gis4. |
    gis8 a4 h8 |
    c8 cis4. |
    cis8 d4. |
    d8 dis4. |
    \mBreak
    
    % cl1 p5 2
    dis8 e4. |
    f8 e4. |
    e8 dis4 d8 |
    g,8 gis4. |
    gis8 a4 h8 |
    c8 cis4. |
    cis8 d4. |
    d8 dis4. |
    dis8 e4. |
    e8 f4. |
    \mBreak
    
    % cl1 p5 3
    e8 r r4 |
    gis2~\f |
    gis2~ |
    gis4. fis8 |
    e8 r r4 |
    gis2~ |
    gis2~ |
    gis4. fis8 |
    e8 r r4 |
    a8\f r r4 |
    R2 |
    \mBreak
    
    % cl1 p5 4
    a8 r r4 |
    R2 |
    \mark 14
    a8 r r4 |
    r8 d,\mf c d |
    c8 r r4 |
    r8 c h c |
    h8 r r as\p |
    g8 r r d' |
    \mBreak
    
    % cl1 p5 5
    c8 r r4 |
    R2*7 |
    r8 c\p r d |
    r8 e r f |
    r8 g r d |
    r8 e, r g |
    r8 c r d |
    \mBreak
    
    % cl1 p5 6
    r8 e r f |
    r8 g r d |
    r8 e, r g |
    R2 |
    r4 a'4\ff |
    g4 g |
    e4 d |
    R2 |
    r4 a' |
    g4 g |
    \mBreak
    
    % cl1 p5 7
    e4 d |
    c4 d |
    e2 |
    f4 g |
    a2 |
    b4 c |
    d2 |
    g,4 b |
    es4. r8 |
    r4 c~\fff |
    c4 c~ |
    \mBreak
    
    % cl1 p5 8
    c4 c~ |
    c4 c |
    \mark 15
    R2*4 |
    e,4 g |
    c4 d |
    c8 e h4 |
    b4 h |
    e,4 g |
    c4 d |
    c8 e h4 |
    \mBreak
    
    % cl1 p5 9
    b4 h |
    \mark 16
    R2*6 |
    % FIXME: Why not just g?
    fis8\f e dis fisis |
    gis8 fis f a |
    R2*6 |
    e8\f\cresc d cis eis |
    fis e dis fisis |
    r8 es r e |
    \mBreak
    
    % cl1 p5 10
    r8 f r f |
    r8 fis r g |
    r8 g r gis |
    r8 a r a |
    r8 ais r h |
    es4\fff es |
    es4 es |
    fis,,2 |
    es2 |
    \mBreak
    
    % cl1 p5 11
    es''4 es |
    es4 es |
    fis,,2 |
    es2 |
    c2 |
    a2 |
    es'2 |
    as,2 |
    R2*2
    fis2~\> |
    fis2~ |
    fis2~ |
    fis2\! |
    R2\fermataMarkup
    \bar "||"
    \pBreak
    
    % cl1 p6 1
    \tempo "Presto."
    c'4\p d |
    e2 |
    d4 e |
    fis2 |
    e4 fis |
    gis4 a |
    a4 as |
    g4 h |
    c4 d |
    e2 |
    d4 e |
    fis2 |
    e4 fis |
    \mBreak
    
    % cl1 p6 2
    gis4\< a |
    a4 as |
    g4 a |
    a4 as |
    g4\mf\> a |
    a4 as |
    g4 r\! |
    c,,4\p d |
    e2 |
    d4 e |
    fis2 |
    e4 fis |
    gis4 a |
    a4 as |
    \mBreak
    
    % cl1 p6 3
    g4 h | 
    c4 d | 
    e2 | 
    d4 e | 
    fis2 | 
    e4 fis | 
    gis4\< a | 
    a4 as | 
    g4 a | 
    a4 as | 
    g4\mf\> a | 
    a4 as | 
    g4 r\! | 
    \mark 17
    g2\sempreFf | 
    g2 |
    \mBreak
    
    % cl1 p6 4
    cis2 |
    c2 |
    c2 |
    h2 |
    a2 |
    \repeat unfold 3 g2 |
    cis2 |
    c2 |
    c2 |
    h2 |
    a2 |
    \repeat unfold 3 g2 |
    cis2~ |
    cis |
    \mBreak
    
    % cl1 p6 5
    \repeat unfold 4 c2 |
    \repeat unfold 2 {
      c4 g |
      c2~ |
      c4 d |
      c4 h 
    }
    h2 |
    gis2 |
    a2 |
    a2 |
    \mBreak
    
    % cl1 p6 6
    gis2 |
    a2 |
    a2 |
    \repeat unfold 3 g2 |
    cis2 |
    c2 |
    c2 |
    h2 |
    a2 |
    \repeat unfold 3 g2 |
    cis2 |
    c2 |
    c2 |
    h2 |
    \mBreak
    
    % cl1 p6 7
    a2 |
    \repeat unfold 3 g2 |
    cis2~ |
    cis2 |
    \repeat unfold 4 c2 |
    c4 g4 |
    c2~ |
    c4 d |
    c4 h |
    c4 g |
    c2~ |
    c4 d |
    \mBreak
    
    % cl1 p6 8
    c4 h |
    c2~ |
    c2 |
    as2~ |
    as2 |
    gis2~ |
    gis |
    a2 |
    gis2 |
    a4 a |
    c2~ |
    c4 c |
    c4 c |
    c4 a |
    c2~ |
    c4 c |
    \mBreak
    
    % cl1 p6 9
    c4 c |
    c2 |
    c2 |
    d2 |
    dis2 |
    \mark 18
    e4 r |
    R2*4 |
    d2~ |
    d2~ |
    d2 |
    g,2 |
    \startMeasureCount
    \repeat unfold 5 c2 |
    \mBreak
    
    % cl1 p6 10
    c2 |
    c2 |
    \stopMeasureCount
    cis2 |
    cis2 |
    c2 |
    h2 |
    g2 |
    \startMeasureCount
    \repeat unfold 7 c2 |
    \stopMeasureCount
    cis2 |
    cis2 |
    c2 |
    \mBreak
    
    % cl1 p6 11
    cis2 |
    \repeat unfold 8 {
      c2 |
      h2 |
    }
    \mBreak
    
    % cl1 p6 12
    c2 |
    h2 |
    \startMeasureCount
    \repeat unfold 9 g2 |
    \stopMeasureCount
    R2 |
    c2 |
    R2 |
    c,,2~ |
    c2\fermata |
    \bar "|."
    \mBreak
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
    % cl2 p1 1
    e'4\ff r |
    g4 r |
    g2~ |
    g4 r\fermata |
    e4 g4 |
    g4 a |
    g2 ~ |
    g4 r\fermata |
    e4 g |
    g4 a |
    g4 g |
    \mBreak
    
    % cl2 p1 2
    e4 d |
    a'4 a |
    e4 f |
    e4 a |
    e4 f |
    a4 g |
    as4 g |
    f4 as |
    g4 r |
    R2 |
    g4 r |
    R2 |
    R2\fermataMarkup |
    \bar "||"
    \mBreak

    % cl2 p1 3
    \tempo "Allegro vivo."
    R2*27 |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2*4 |
        \revert MultiMeasureRest.staff-position
        r4 es8(\f d) |
      }
      \new CueVoice {
        \set instrumentCueName = "Viol.I"
        \stemUp {
          g,4->( e8) d |
          h8 d h d |
          g8 a h4 |
          g8 a h g |
          a8 g \hideNotes r4 \unHideNotes |
        }
      }
    >>
    c4\p h |
    c4 c |
    c8 c h4-> |
    e,8 e e4-> |
    \mBreak
    
    % cl2 p1 4
    e4 h' |
    c4 c |
    c8 c h4 |
    a8 f e r |
    R2*8 |
    \mark #1
    R2*8 |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Cl.I"
        \stemUp {
          c4 d |
          e4 f |
          e8 c' d,4 |
          c8 e e,4 |
        }
      }
    >>
    R2*4 |
    \mBreak

    % cl2 p1 5
    c''4\f d |
    e4 f |
    g4 g |
    e8 c g4 |
    c4 d |
    e4 f |
    g4 g |
    e8 c g4 |
    \mark #2 |
    c4\mf c |
    c4 c |
    \mBreak

    % cl2 p1 6
    c8 c h4 |
    g8 c, c4 |
    c'4 c |
    c4 c |
    c8 c h4 |
    c8 r r4 |
    R2*8 |
    h8-.\p \repeat unfold 3 h-. |
    R2 |
    \mBreak

    % cl2 p1 7
    \repeat unfold 4 h8
    R2 |
    \repeat unfold 2 { c8 c r4 } |
    c8\cresc c r4 |
    c8 c r4 |
    \repeat unfold 2 { cis8 cis r4 } |
    cis8\mf cis r4 |
    cis8 cis r4 |
    \mBreak

    % cl2 p1 8
    \mark #3 |
    d8\ff r r4 |
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
          c,8 r d r |
          e8 r f r |
          e8 g d4 |
          c8 a g r |
        }
      }
    >>
    R2*4 |
    e'2\mf |
    es2\cresc |
    e2 |
    \mBreak
    
    % cl2 p1 9
    es2\< |
    e2 |
    es2 |
    e2 |
    es2 |
    e'2\f |
    es2 |
    e2 |
    es2 |
    e2\ff |
    es2 |
    e2 |
    es2 |
    \pBreak

    % cl2 p2 1
    c4 d |
    e2 |
    c4 d |
    e2 |
    \repeat unfold 2 {
      c8 d e c |
      as8 b c a |
    }
    gis8 h e gis, |
    \mBreak

    % cl2 p2 2
    e8 g c e, |
    gis8 h e gis, |
    e8 g c4 |
    \repeat unfold 4 {
      e,8 g c4 |
    }
    \mark 4 |
    r4 c |
    es4 f |
    \mBreak

    % cl2 p2 3
    es4 f |
    as4 g |
    R2*2 |
    e4\ff g |
    g4 a |
    g8 g g4 |
    e8 c h4 |
    e4 g |
    g4 a |
    g8 g g4 |
    e8 c h4 |
    \mBreak

    % cl2 p2 4
    \repeat unfold 2 { 
      g'2 |
      as2 |
    }
    g4 r |
    a4 r |
    g4 r |
    R2 |
    g4 r |
    a4 r |
    g4 r |
    R2*5 
    \mark 5 |
    R2*28 |
    \mBreak
    
    % cl2 p2 5
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Cl.I"
        \stemUp {
          b,8 h4. |
          h8 c4. |
          c8 des4. |
          c8 r r4 |
        }
      }
    >>
    r8 gis8(\f c d |
    e8) r es( d~ |
    d8) e, c'( h |
    a) r r4 |
    \mBreak
    
    % cl2 p2 6
    r8 gis( c d |
    e8) r e( d~ |
    d8) e, c'( h |
    a8) r r4 |
    c8\f r r4 |
    R2 
    c8 r r4 |
    R2 |
    \mBreak

    % cl2 p2 7
    c8 r r4 |
    r8 des,\f c des |
    c8 r r4 |
    r8 ces\mf b ces |
    b r r g\p
    as8 r r des |
    \mark 6
    c8 r r4 |
    R2*7 |
    \mBreak

    % cl2 p2 8
    r8 c\p r des |
    r8 es r f |
    r8 es r es |
    r8 as, r b |
    r8 c r des |
    r8 es r f |
    r8 es r es |
    \mBreak
    
    % cl2 p2 9
    r8 as, r b |
    R2 |
    r4 des'\ff |
    c4 b |
    as4 b |
    R2 |
    r4 des |
    c4 b |
    as4 b |
    as4 b |
    c2 |
    \mBreak

    % cl2 p2 10
    des4 as |
    des2 |
    b4 des |
    ges2 |
    es4 ges |
    ces4. r8 |
    r4 as\ff~ |
    as4 as~ |
    as4 as~ |
    as4 as |
    R2*4 |
    \pBreak

%{
    
    % cl2 p3 1
    \mark 7
    as4\ff b |
    c4 des |
    c8 es b4 |
    ces4 b |
    as4 b |
    c4 des |
    c8 es b4 |
    ces4 b |
    as4 b |
    r4 es, |
    r4 es |
    r4 es |
    \mBreak
    
    % cl2 p3 2
    r4 es |
    as,2~ |
    as2 |
    f,2~ |
    f2 |
    r4 es''4 |
    \repeat unfold 3 { r4 es } |
    as,2~ |
    as2 |
    fes,2~ |
    fes2 |
    \mBreak
    
    % cl2 p3 3
    cis'2~\f |
    cis 2 |
    R2*6 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Ob.I"
        \stemUp {
          des'8 r es r |
          f8 r ges r |
          f8 b es, r |
          d8 f ces r |
        }
      }
    >>
    b8\p r c r |
    d8 r es r |
    \mBreak
    
    % cl2 p3 4
    d8 g c, r |
    h8 d g, r |
    R2*4 |
    c8\p r d r |
    e8 r f r |
    e8 a d, r |
    cis8 e a, r |
    \mark 8
    fis2~\p |
    fis2 |
    \mBreak
    
    % cl2 p3 4
    g2~ |
    g2 |
    f2( |
    es2) |
    des2 |
    ces2 |
    b2 |
    b'2 |
    ces2~ |
    ces2 |
    a2 |
    g2 |
    f2 |
    es2 |
    R2*4 |
    \mBreak

    % cl2 p3 5
    g8\p r a r |
    h8 r c r |
    h8 e a, r |
    gis8 h e, r |
    R2*4 |
    a8 r h r |
    cis8 r d r |
    cis8 fis h, r |
    \mBreak
    
    % cl2 p3 6
    ais8 cis fis, r |
    dis2~\p |
    dis2 |
    e2~ |
    e2 |
    d2 |
    c2 |
    b2 |
    as2 |
    g2 |
    g'2\cresc |
    as2~ |
    as2 |
    \mBreak
    
    % cl2 p3 7
    fis2 |
    e2 |
    d2 |
    c2 |
    \mark 9
    h''8\f r h a |
    r4 g8 f |
    e8 r e d |
    r4 c8 h |
    e8 r c' h |
    r4 a8 g |
    \mBreak
    
    % cl2 p3 8
    fis8 r fis e |
    r4 d8 cis |
    d8 r e\cresc r |
    fis8 r g r |
    fis8 h e, r |
    dis8 fis h, r |
    g'8 r a r |
    h8 r c r |
    \mBreak
    
    % cl2 p3 9
    h8 e a, r |
    gis8 h e, r |
    c'8\ff r c d |
    r4 dis8 e |
    fis,8 r fis g |
    r4 gis8 ais |
    d8 r d cis |
    r4 gis8 fis |
    \pBreak
    
    % cl2 p4 1
    gis8 r gis fis |
    r4 e8 dis |
    e8 r fis r |
    gis8 r a r |
    gis8 cis fis, r |
    eis8 gis cis, r |
    a'8 r h r |
    cis8 r d r |
    \mBreak
    
    % cl2 p4 2
    cis8 ais h r |
    b8 cis g r |
    g4\ff r |
    h4 r |
    c4 r |
    h4 r |
    g4 r |
    h4 r |
    c4 r |
    h4 r |
    \mBreak
    
    % cl2 p4 3
    \mark 11
    g,4\sempreFf a |
    h4 c |
    h8 e a,4 |
    gis8 h f4 |
    e4 fis |
    gis4 a |
    gis8 cis fis,4 |
    eis8 gis cis,4 |
    a'4 h |
    cis4 d |
    \mBreak
    
    % cl2 p4 4
    cis8 fis h,4 |
    ais8 cis g4 |
    fis4 gis |
    ais4 h |
    ais8 dis gis,4 |
    % FIXME: really? why not just g?
    fisis8 ais dis,4 |
    as'4 b |
    c4 des |
    c8 f b,4 |
    a8 c f,4 |
    \mBreak
    
    % cl2 p4 5
    b4 c |
    d4 es |
    d8 g c,4 |
    h8 d g,4 |
    c8 d e g |
    a,8 h cis e |
    d8 e fis a |
    h, cis dis fis |
    e fis gis h |
    \mBreak
    
    % cl2 p4 6
    \repeat unfold 3 {
      cis,8 dis eis gis |
    }
    a,4 h |
    cis4 d |
    cis8 fis h,4 |
    ais8 cis fis,4 |
    d'4 e |
    fis g |
    \mBreak
    
    % cl2 p4 7
    fis8 h e,4 |
    dis8 fis dis4 |
    e8 r r4 |
    R2 |
    r4 g |
    e4 g |
    R2*2 |
    r4 g |
    e4 g |
    \mark 12
    c,,4\mf d |
    e4 f |
    \mBreak
    
    % cl2 p4 8
    e8 a d,4 |
    cis8 e a,4 |
    h4 cis |
    dis e |
    dis8 fis ais,4 |
    h8 dis g,4 |
    e'4\f fis |
    g4 as |
    g8 c f,4 |
    e8 g c,4 |
    \mBreak
    
    % cl2 p4 9
    d4 e |
    fis4 g |
    fis8 d' e,4 |
    d8 a' g4 |
    R2*2 |
    a4 h |
    cis4 d |
    f8 a e4 |
    dis8 fis h,4 |
    h4 cis |
    \mBreak
    
    % cl2 p4 10
    dis4 e |
    c4 d |
    e4 f |
    d4 e |
    fis4 g |
    h2\ff |
    c2 |
    cis2 |
    d2 |
    \mark13
    R2*16 |
    \pBreak
    
    % cl2 p5 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Viol.I"
        \stemUp {
          a,8 r a h~ |
          h4 a8 g |
          a8 c d e |
          c
        }
        \set instrumentCueName = "Fl.I"
        \stemUp {
          g'[ c d] |
        }
      }
    >>
    g,,8 gis4. |
    gis8 a4 h8 |
    c8 cis4. |
    cis8 d4. |
    d8 dis4. |
    \mBreak
    
    % cl2 p5 2
    dis8 e4. |
    f8 e4. |
    e8 dis4 d8 |
    g,8 gis4. |
    gis8 a4 h8 |
    c8 cis4. |
    cis8 d4. |
    d8 dis4. |
    dis8 e4. |
    e8 f4. |
    \mBreak
    
    % cl2 p5 3
    e8 r r4 |
    gis2~\f |
    gis2~ |
    gis4. fis8 |
    e8 r r4 |
    gis2~ |
    gis2~ |
    gis4. fis8 |
    e8 r r4 |
    a8\f r r4 |
    R2 |
    \mBreak
    
    % cl2 p5 4
    a8 r r4 |
    R2 |
    \mark 14
    a8 r r4 |
    r8 d,\mf c d |
    c8 r r4 |
    r8 c h c |
    h8 r r as\p |
    g8 r r d' |
    \mBreak
    
    % cl2 p5 5
    c8 r r4 |
    R2*7 |
    r8 c\p r d |
    r8 e r f |
    r8 g r d |
    r8 e, r g |
    r8 c r d |
    \mBreak
    
    % cl2 p5 6
    r8 e r f |
    r8 g r d |
    r8 e, r g |
    R2 |
    r4 a'4\ff |
    g4 g |
    e4 d |
    R2 |
    r4 a' |
    g4 g |
    \mBreak
    
    % cl2 p5 7
    e4 d |
    c4 d |
    e2 |
    f4 g |
    a2 |
    b4 c |
    d2 |
    g,4 b |
    es4. r8 |
    r4 c~\fff |
    c4 c~ |
    \mBreak
    
    % cl2 p5 8
    c4 c~ |
    c4 c |
    \mark 15
    R2*4 |
    e,4 g |
    c4 d |
    c8 e h4 |
    b4 h |
    e,4 g |
    c4 d |
    c8 e h4 |
    \mBreak
    
    % cl2 p5 9
    b4 h |
    \mark 16
    R2*6 |
    % FIXME: Why not just g?
    fis8\f e dis fisis |
    gis8 fis f a |
    R2*6 |
    e8\f\cresc d cis eis |
    fis e dis fisis |
    r8 es r e |
    \mBreak
    
    % cl2 p5 10
    r8 f r f |
    r8 fis r g |
    r8 g r gis |
    r8 a r a |
    r8 ais r h |
    es4\fff es |
    es4 es |
    fis,,2 |
    es2 |
    \mBreak
    
    % cl2 p5 11
    es''4 es |
    es4 es |
    fis,,2 |
    es2 |
    c2 |
    a2 |
    es'2 |
    as,2 |
    R2*2
    fis2~\> |
    fis2~ |
    fis2~ |
    fis2\! |
    R2\fermataMarkup
    \bar "||"
    \pBreak
    
    % cl2 p6 1
    \tempo "Presto."
    c'4\p d |
    e2 |
    d4 e |
    fis2 |
    e4 fis |
    gis4 a |
    a4 as |
    g4 h |
    c4 d |
    e2 |
    d4 e |
    fis2 |
    e4 fis |
    \mBreak
    
    % cl2 p6 2
    gis4\< a |
    a4 as |
    g4 a |
    a4 as |
    g4\mf\> a |
    a4 as |
    g4 r\! |
    c,,4\p d |
    e2 |
    d4 e |
    fis2 |
    e4 fis |
    gis4 a |
    a4 as |
    \mBreak
    
    % cl2 p6 3
    g4 h | 
    c4 d | 
    e2 | 
    d4 e | 
    fis2 | 
    e4 fis | 
    gis4\< a | 
    a4 as | 
    g4 a | 
    a4 as | 
    g4\mf\> a | 
    a4 as | 
    g4 r\! | 
    \mark 17
    g2\sempreFf | 
    g2 |
    \mBreak
    
    % cl2 p6 4
    cis2 |
    c2 |
    c2 |
    h2 |
    a2 |
    \repeat unfold 3 g2 |
    cis2 |
    c2 |
    c2 |
    h2 |
    a2 |
    \repeat unfold 3 g2 |
    cis2~ |
    cis |
    \mBreak
    
    % cl2 p6 5
    \repeat unfold 4 c2 |
    \repeat unfold 2 {
      c4 g |
      c2~ |
      c4 d |
      c4 h 
    }
    h2 |
    gis2 |
    a2 |
    a2 |
    \mBreak
    
    % cl2 p6 6
    gis2 |
    a2 |
    a2 |
    \repeat unfold 3 g2 |
    cis2 |
    c2 |
    c2 |
    h2 |
    a2 |
    \repeat unfold 3 g2 |
    cis2 |
    c2 |
    c2 |
    h2 |
    \mBreak
    
    % cl2 p6 7
    a2 |
    \repeat unfold 3 g2 |
    cis2~ |
    cis2 |
    \repeat unfold 4 c2 |
    c4 g4 |
    c2~ |
    c4 d |
    c4 h |
    c4 g |
    c2~ |
    c4 d |
    \mBreak
    
    % cl2 p6 8
    c4 h |
    c2~ |
    c2 |
    as2~ |
    as2 |
    gis2~ |
    gis |
    a2 |
    gis2 |
    a4 a |
    c2~ |
    c4 c |
    c4 c |
    c4 a |
    c2~ |
    c4 c |
    \mBreak
    
    % cl2 p6 9
    c4 c |
    c2 |
    c2 |
    d2 |
    dis2 |
    \mark 18
    e4 r |
    R2*4 |
    d2~ |
    d2~ |
    d2 |
    g,2 |
    \startMeasureCount
    \repeat unfold 5 c2 |
    \mBreak
    
    % cl2 p6 10
    c2 |
    c2 |
    \stopMeasureCount
    cis2 |
    cis2 |
    c2 |
    h2 |
    g2 |
    \startMeasureCount
    \repeat unfold 7 c2 |
    \stopMeasureCount
    cis2 |
    cis2 |
    c2 |
    \mBreak
    
    % cl2 p6 11
    cis2 |
    \repeat unfold 8 {
      c2 |
      h2 |
    }
    \mBreak
    
    % cl2 p6 12
    c2 |
    h2 |
    \startMeasureCount
    \repeat unfold 9 g2 |
    \stopMeasureCount
    R2 |
    c2 |
    R2 |
    c,,2~ |
    c2\fermata |
    \bar "|."
    \mBreak
%}
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

%{
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
%}


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
