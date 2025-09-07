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
  title = "Im schottischen Hochland"
  subtitle = ""
  composerShort = "Niels Gade"
  composer = "Niels Gade (1817 - 1890)"
  version = "v1"
}

% Adapt this for automatic line-breaks
% mBreak = {}
% pBreak = {}
mBreak = { \break }
pBreak = { \pageBreak }
#(set-global-staff-size 17.9)

% Just to make it easier to add rehearsal marks
rMark = { \mark \default }

% Useful snippets
pCresc = _\markup { \dynamic p \italic "cresc." }
fCresc = _\markup { \dynamic f \italic "cresc." }
mfDim = _\markup { \dynamic mf \italic "dim." }
fCantabile = _\markup { \dynamic f \italic "cantabile" }
pDolce = _\markup { \dynamic p \italic "dolce" }
dolce = _\markup { \italic "dolce" }
smorz = _\markup { \italic "smorz." }
sempreFf = _\markup { \italic "sempre" \dynamic ff }
sempreFff = _\markup { \italic "sempre" \dynamic fff }
sempreP = _\markup { \italic "sempre" \dynamic p }
semprePp = _\markup { \italic "sempre" \dynamic pp }
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
marcato = _\markup { \italic "marcato" }
string = ^\markup { \italic "string." }
stringendo = ^\markup { \italic "stringendo" }
stringendoMolto = ^\markup { \italic "stringendo molto" }
pocoString = ^\markup { \italic "poco string." }
sempreStringendo = ^\markup { \italic "sempre stringendo" }
sempreString = ^\markup { \italic "sempre string." }
tuttaForza = _\markup { \italic "tutta forza" }
allargando = _\markup { \italic "allargando" }
pocoMenoMosso = ^\markup {\italic \bold {"Poco meno mosso."} }
rit = ^\markup {\italic {"rit."} }
rall = ^\markup {\italic {"rall."} }
riten = ^\markup {\italic {"riten."} }
ritenMolto = ^\markup {\italic {"riten. molto"} }
ritATempo = ^\markup { \center-align \italic {"  rit. a tempo"} }
aTempo = ^\markup { \italic {"a tempo"} }
moltoRit = ^\markup { \italic {"molto rit."} }
pocoRit = ^\markup {\italic {"poco rit."} }
pocoRiten = ^\markup {\italic {"poco riten."} }
sec = ^\markup {\italic {"sec."} }
pesante = ^\markup {\italic {"pesante"} }
pocoRall = ^\markup {\italic {"poco rall."} }
pPocoAPocoCresc = _\markup {\dynamic p \italic {"poco a poco cresc."} }
pocoAPocoRall = ^\markup {\italic {"poco a poco rall."} }
pocoAPocoAccel = ^\markup {\italic {"poco a poco accel."} }
pocoAnimando = ^\markup {\italic {"poco animando"} }
pocoAPocoAccelAlD = ^\markup {\italic {"poco a poco accel. al D"} }
sempreAccel = ^\markup {\italic {"sempre accel."} }
solo = ^\markup { "Solo" }
piuF = _\markup { \italic "più" \dynamic f }
piuP = _\markup { \italic "più" \dynamic p }
lento = ^\markup { \italic "Lento" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \italic { "Tempo I" } }
incalcando = ^\markup { \italic "incalcando" }
comePrima = ^\markup { \italic "come prima" }
sff = _\markup { \dynamic { sff } } 
dimUnPoco = _\markup { \italic "dim. un poco" }
dimPocoAPoco = _\markup { \italic "dim. poco a poco" }
animando = ^\markup { \italic "animando" }
cantabile = ^\markup { \italic "cantabile" }
fMarcato = _\markup { \dynamic f \italic "marcato" }
leggieramente = _\markup { \italic "leggieramente" }
conEspressione = ^\markup { \italic "con espressione" }
grandioso = _\markup { \italic "grandioso" }

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
      "   -   "
      \fromproperty #'header:title
      "   -   "
      \fromproperty #'header:instrument
    }
    \if \should-print-page-number \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \if \should-print-page-number \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:composerShort
      "   -   "
      \fromproperty #'header:title
      "   -   "
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
  markup-system-spacing.basic-distance = #5
  markup-system-spacing.minimum-distance = #5
  markup-system-spacing.padding = #3
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

gade_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Andante"
  \key f \major
  \clef violin
  \relative c' {
    % cl1 1 1
    f8(\pDolce c4.) f4( g |
    a4 c f2~\< |
    f4.\> c8\!) c4( a) |
    f4.( a8 g2) |
    R1*2 |
    f8(\pp c4.) f4( g |
    a4 c f2~\< |
    f4.\> c8\!) c4( a) |
    \mBreak

    % cl1 1 10
    f4.( a8 g2) |
    R1*2 |
    g4( a b c) |
    b8(\< d4.)\! c8(\< f4.)\! |
    c4( a f g8 a) |
    a4.( f8 g2) |
    g4(\< a d\> g,) |
    c8(\< f4.\!) f2( |
    c4 a) c4( a8 f) |
    \mBreak
    
    % cl1 1 20
    a4( g2.) |
    R1*5 |
    r2 f'2~\fz |
    \mark #1
    f4\pDolce d8.( f16) f4.(\< e8 |
    g4) \tuplet 3/2 { e8(\! f g) } g4.(\< f8\! |
    a8) f8(\< a c) c2~( |
    c4\> a g8 f e4) |
    d2(\p f4.\dim e8) |
    e2\pp r |
    R1*2 |
    \mBreak
    
    % cl1 1 35
    f,8(\dolce c4.) f4( g |
    a4 c f2~\< |
    f4.\> c8\!) c4( a) |
    f4.(\< g8\> f2)\! |
    R1*4 |
    \bar "|."
    \tempo "Allegro moderato"
    R1*2 |
    a4\pp g8.-. f16-. e4-. g-. |
    f4-. \tuplet 3/2 { e8-. f-. g-. } f4-. a~-> |
    a4 g8.-. f16-. e4-. g-. |
    \mBreak
    
    % cl1 1 48
    f4-. f'8.-. g16-. a2~-> |
    a4 g8.-. f16-. e4-. g-. |
    f4-. \tuplet 3/2 { e8-. f-. g-. } f4-. a~-> |
    a4 g8.-. f16-. e4-. a-. |
    f4 f2\fz f8.-. g16-. |
    a4( c8.) a16-. f4-. a-. |
    g4-. f2\fz f8.-. g16-. |
    \mBreak

    % cl1 1 55
    a4( c8.) a16-. f4-. a-. |
    g4 c8.(-> g16)\cresc g4\accel c8.(-> g16) |
    g4 c8.(-> g16 c4) c8.(-> g16 |
    c1~)\f-> |
    c1 |
    c1~-> |
    c1~ |
    c4 c2-> c4~-> |
    c4 c2-> r4 |
    R1 |
    \mBreak
    
    % cl1 1 65
    g,2.\f b4 |
    b4 b b b |
    b2. a4 |
    \bar "|." |
    \time 2/2
    \tempo "Allegro di molto"
    a'2(\ff f4) r |
    a2( f4) r |
    f2. f8-. f-. |
    \appoggiatura a8 g->( f) f-. f-. \appoggiatura a8 g->( f) f-. f-. |
    \appoggiatura a8 g-. f-. \appoggiatura a8 g-. f-. \appoggiatura a8 g-. f-. g8.->( c16) |
    \mBreak
    
    % cl1 1 73
    c2.\fermata r4 |
    a2( f4) r |
    a2( f4) r |
    f2. f8-. f-. |
    \appoggiatura a8 g->( f) f-. f-. \appoggiatura a8 g->( f) f-. f-. |
    \appoggiatura a8 g f-. \appoggiatura a8 g f-. \appoggiatura a8 g f-. g8.->( c,16) |
    g'2.-> g,8.( d'16) |
    d2.-> g,8.( g'16) |
    \mBreak
    
    % cl1 1 81
    g2.-> c,8.( c'16) |
    c4( \tuplet 3/2 { a8 f c } a4) f' |
    f4( \tuplet 3/2 { d'8 b g } f4) f |
    f4 f8 f \appoggiatura a8 g( f) f-. f-. |
    \appoggiatura a8 g( f) f-. f-. a4 b |
    c4-. r r2 |
    R1 |
    c,2\f c |
    \mBreak
    
    % cl1 1 89
    c1 |
    c1->~ |
    c2. \tuplet 3/2 { c8(\ff f a } |
    c2 a4) \tuplet 3/2 { c,8( f a } |
    c4.) a8 c,4-. f-. |
    d4-. r r2 |
    r2 r4 \tuplet 3/2 { f,8( b d } |
    f2 d4) \tuplet 3/2 { f,8( b d } |
    f4.) d8 f4 d8-. b-. |
    \mBreak
    
    % cl1 1 98
    \mark #2
    g4 \tuplet 3/2 { f'8( g a } g4) a4-. |
    c2->( g4) r |
    r4 \tuplet 3/2 { g8( a b } a4) g-. |
    c2( a4) r |
    r4 \tuplet 3/2 { a8( b c } b4) a-. |
    a4->( g) r2 |
    a4->( g) r2 |
    R1 |
    \mBreak
    
    % cl1 1 106
    as4->(\mf g) r2 |
    as4->( g) r2 |
    r4 c,(\< des d) |
    es4\f r r2 |
    R1*9 |
    r2 b2~\p |
    b2. g'4-. |
    g4.( f8) es4-. d-. |
    d4( c) c-. c-. |
    R1 |
    \pBreak
    
    % cl1 p2 124
    es2. g4-. |
    g4(\< as8) f-.\! es4-. d-. |
    d4( c) c-. c-. |
    d4-. d-. \appoggiatura es8 d4( \< c8) d-. |
    es2.(\fz\> c4 |
    g1)\p( |
    g4\< e'?\> d c\!) |
    \appoggiatura e8 d4( c h a) |
    a4.( g8) g2 |
    r4 g(\dolce  c h |
    \mBreak
    
    % cl1 p2 134
    g\< g'\> f e)\! |
    e4( d c h) |
    c4.( g8) g4( e') |
    e4(\< d g\> h,)\! |
    c4.( g8) g4(\< c8 e |
    a4\> g c,\! d) |
    f2( e4) r |
    \mark #3 
    R1 |
    g2.\p r4 |
    R1 |
    \mBreak
    
    % cl1 p2 144
    g2.\p g,8.( d'16) |
    d2->( c4)\cresc h8-. d-. |
    f1->(\fz |
    e2.) e4\p |
    e4.( d8) c4-. h-. |
    h4( a) a-. a-. |
    h4-. h-. \appoggiatura c8 h4( a8) h-. |
    c4( e a,) a |
    h4-. h-. \appoggiatura c8 h4( a8) h-. |
    \mBreak

    % cl1 p2 153
    c4( e a,) e'-. |
    c4( e\cresc a,) e'-. |
    e2( g4) e |
    f4\f r4 r2 |
    R1 |
    c'2->\f c-> |
    f,2 r |
    \mark #4 
    g,1~\ff |
    g4 r r \tuplet 3/2 { g8(\ff c e } |
    g2 e4) \tuplet 3/2 { c8( e g } |
    \mBreak
    
    % cl1 p2 163
    c2 \tuplet 3/2 { g8)[ c,,( e] } \tuplet 3/2 { g8 c e) } |
    g4..->( f16) e4 d |
    g4 g8.( c16) c4 e,8.( g16) |
    g4..->( f16) e4 d |
    g4 g8.( c16) c4 e,8.( g16) |
    g4..->( f16) e4 d |
    \mBreak

    % cl1 p2 169
    e4..->( d16) c4 h |
    c4..->( h16) a4 gis |
    a4 c8.( f16) f4 a,8.( c16) |
    c4..(-> h16) a4 gis |
    a4 c8.( f16) f4 c8.( a'16) |
    a4.->\marcato g8 f4 e |
    g4 f e d |
    c g a h-> |
    \mBreak
    
    % cl1 p2 177
    c4 g8.( g'16) g4 g,8.( a'16) |
    a4.->g8 f4 e |
    g4 f e d |
    c4 e f g |
    e4 e f g |
    e4 r r2 |
    r4 g f f |
    e4 r r8. g,16 c8. e16 |
    \mBreak
    
    % cl1 p2 185
    g4 r r8. g,16 c8. e16 |
    e8. g,16 c8. e16 g8. c,16 e8. g16 
    g2 g |
    g8. g,16 c8. e16 g8. c,16 e8. g16 
    g2 d |
    e1 |
    e1 |
    c1 |
    c1 |
    \mBreak
    
    % cl1 p2 194
    c1~\dim |
    c1~\p 
    c1 |
    R1*3 |
    \mark #5
    R1*3
    r4 \tuplet 3/2 { e8\p( f g } f4\< e |
    c'2 \> a |
    g4)\p r r2 |
    R1*6 
    r4 \tuplet 3/2 { e8\p( f g } f4 e |
    \mBreak
    
    % cl1 p2 213
    a2 f |
    e4) r e,2(\< |
    fis1\>)( |
    g4)\! r r2 |
    R1*7 |
    r2 r4 g'8.(\p b16) |
    b2 r4 g8.( b16) |
    b2 r4 g8.( b16) |
    b2 r4 g8.( b16) |
    b2 r4 g8.(\cresc a16) |
    \mBreak
    
    % cl1 p2 229
    a2 r4 g8.( a16) |
    a4 a2 a4~\< |
    a4 a2 a4~\! |
    a4 r r2 |
    d2.->\ff f,4 |
    d'4 f, g a |
    d,4 r r2 |
    r2 r4 f8.( a16) |
    a4 f8.( a16) a4 r |
    R1 |
    \mBreak
    
    % cl1 p2 239
    b2.-> d4 |
    b4 d, es f |
    b,4 r r b'8.( f16) |
    f4 b8.( f16) f4 b |
    R1 |
    es,2.-> g4 |
    es4 es f g |
    g4 g2-> g4~-> |
    g4 es f g |
    as4 es2-> as4~-> |
    \pBreak
    
    % cl1 p3 250
    as2 g~-> |
    g2 f-> |
    f1-> |
    f1 |
    f1 |
    f1 |
    \mark #6 
    f4 r r2 |
    f4 r r2 |
    des4 r r2 |
    as4 r r2 |
    R1*9 |
    r2 r4 c,(\p
    \mBreak
    
    % cl1 p3 269
    c'4 b a gis |
    a4) r r c,4( |
    c'4 b\cresc a gis) |
    a2. c8(\< f |
    b4\> a\! d, e) |
    g2( f4) r |
    R1 |
    c2.\p r4 |
    a'4( g c, d) |
    f2( e4) c8.( g'16) |
    \mBreak
    
    % cl1 p3 279
    g2(-> f4) e8-. g-. |
    \mark #7
    b2\fz r |
    r2 r4 a4-. |
    a4.( g8) f4-. e-. |
    e4( d) d-. d-. |
    e4-. e-.\cresc \appoggiatura f8 e4( d8) e-. |
    f4( a d,) a' |
    a4( b8) g f4-. e-. |
    e4( d) d-. d-. |
    \mBreak
    
    % cl1 p3 288
    e4-. e-.\cresc \appoggiatura f8 e4( d8) e-. |
    f2(-> d4)\! r |
    R1*7 |
    r4 c(\f f e |
    c4 a' g f) |
    \appoggiatura a8 g4( f e d) |
    d4.( c8) c2~ |
    c4 c( f e) |
    c4( c' b a) |
    \mBreak
    
    % cl1 p3 303
    a4( g f e) |
    f4.( c8) c4 c8.( a'16) |
    a4( g f e) |
    f4.( c8) c4 c |
    b'2(-> g4) c, |
    b'2(-> g4) c, |
    c'2(-> a4) \tuplet 3/2 { c,8( f a } |
    c2 \tuplet 3/2 { a8)[ f( c] } \tuplet 3/2 { f a c) } 
    \mBreak
    
    % cl1 p3 311
    f,4( \tuplet 3/2 { c8 a' g } f4) f8-. f-. |
    \appoggiatura a8 g->( f) f-. f-. \appoggiatura a8 g->( f) f-. f-. |
    \appoggiatura c'8 b->( a) a-. a-. \appoggiatura c8 b->( a) a-. a-. |
    b->( a) a-. a-. b->( a) a-. a-. |
    d->( cis) cis-. cis-. d->( cis) cis-. cis-. |
    \mBreak
    
    % cl1 p3 316
    cis4 a2.-> |
    a2.-> c,8.( c'16) |
    c4 r r c,8.( c'16) |
    c4 r r c,8.( c'16) |
    a4..-> g16 f4 e |
    f4 c8.( f16) f4 c8.( a'16) |
    a4..-> g16 f4 e |
    f4 r g r |
    \mBreak
    
    % cl1 p3 324
    a4..-> a16 g4 d |
    a'4 g d b |
    c4 c d a' |
    f4 r g r |
    \mark #9
    a4..-> a16 g4 d |
    a'4 g d b |
    a'4..-> a16 g4 d |
    a'4 g d b |
    d4..->\marcato c16 b4-> a-> |
    \mBreak
    
    % cl1 p3 333
    g4(-> c) c-> f-> |
    d'4..-> c16 b4-> a->
    a4( g) g c,( |
    b'4..)-> a16 g4 f |
    e4( g c) a4-. |
    d4..-> c16 b4 a |
    a4( g c) a-. |
    a4( g c) a-. |
    c4( a) c( a) |
    \mBreak
    
    % cl1 p3 342
    c,4->\ff\marcato d-> f2-> |
    c4-> d-> f2-> |
    f2 d |
    a4. b8 c2 |
    c4-> d-> f2-> |
    c4-> d-> f2-> |
    a2-> f4. a,8 |
    b2( c) |
    a4-> b-> c2-> |
    c4-> d-> f2-> |
    f1( |
    \mBreak
    
    % cl1 p3 353
    g4) g8.( c16) c2( |
    a4) b, c2 |
    c4 d f2 |
    a1( |
    g4) g8.( c16) c2( |
    a4) g8.( c16) c2( |
    a4) c( a) c( |
    a4) c( a) c( |
    a4) \appoggiatura d,8 c2-> \appoggiatura d8 c4~-> |
    \mBreak
    
    % cl1 p3 362
    c4 \appoggiatura d8 c2-> \appoggiatura d8 c4~-> |
    c4 \appoggiatura d8 c2-> \appoggiatura d8 c4~-> |
    c4 \appoggiatura d8 c2-> \appoggiatura d8 c4~-> |
    c4 r c' r |
    a4 r f r |
    c4 r8 f,8 f4 \appoggiatura g8 f4 |
    a4 r8 f8 f4 \appoggiatura g8 f4 |
    \appoggiatura g'8 f1~-> |
    f1 |
    f,1->\fermata ||
    \bar "|."
    \pBreak
  }
}

gade_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Andante"
  \clef violin
  \relative c' {
    R1
  }
}


%{  

%}

% ---------------------------------------------------------

%%{
\bookpart {
  \header{
    instrument = "Klarinette I in A"
  }
  \score {
    \new Staff {
      \transpose a a \gade_clarinet_I
    }
  }
}
%%}

%{
\bookpart {
  \header{
    instrument = "Klarinette II in A"
  }
  \score {
    \new Staff {
      \transpose a a \gade_clarinet_II
    }
  }
}
%}
