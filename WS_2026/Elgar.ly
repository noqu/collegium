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
  title = "Cello Concerto, Op. 85"
  subtitle = ""
  composerShort = "Edward Elgar"
  composer = "Edward Elgar (1857 - 1934)"
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
smorz = _\markup { \italic "smorz." }
sempreFf = _\markup { \italic "sempre" \dynamic ff }
sempreFff = _\markup { \italic "sempre" \dynamic fff }
sempreP = _\markup { \italic "sempre" \dynamic p }
semprePp = _\markup { \italic "sempre" \dynamic pp }
ffSempre = _\markup { \dynamic ff \italic "sempre" }
dolce = _\markup { \italic "dolce" }
ppDolce = _\markup { \dynamic pp \italic "dolce"  }
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
stringendoMolto = ^\markup { \italic "stringendo molto" }
pocoString = ^\markup { \italic "poco string." }
sempreStringendo = ^\markup { \italic "sempre stringendo" }
sempreString = ^\markup { \italic "sempre string." }
tuttaForza = _\markup { \italic "tutta forza" }
allargando = ^\markup { \italic "allargando" }
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
animato = ^\markup { \italic "animato" }
cantabile = ^\markup { \italic "cantabile" }
fMarcato = _\markup { \dynamic f \italic "marcato" }
leggieramente = _\markup { \italic "leggieramente" }
conEspressione = ^\markup { \italic "con espressione" }
dolcePossibile = ^\markup { \italic "dolce possibile" }
collaParte= ^\markup{ \italic "colla parte" }
pocoAllarg = ^\markup{ \italic "poco allarg" }
inTempo = ^\markup{ \italic "(in tempo)" }
larg = ^\markup{ \italic "larg." }
moltoCresc = _\markup{ \italic "molto cresc." }
accell = ^\markup{ \italic "accel." }
piuLento = ^\markup{ \italic "Più lento" }
piuMosso = ^\markup{ \italic "Più mosso" }
stringMolto = ^\markup{ \italic "string.molto" }
brillante = ^\markup{ \italic "brillante" }
largamente = ^\markup{ \italic "largamente" }
calando = ^\markup{ \italic "calando" }
moltoLarg = ^\markup{ \italic "molto larg." }
moltoAllarg = ^\markup{ \italic "molto allarg." }
piuTranquillo = ^\markup{ \italic "più tranquillo" }


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
      % " (" \fromproperty #'header:subtitle ") "
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
      % " (" \fromproperty #'header:subtitle ") "
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
  markup-system-spacing.basic-distance = #4
  markup-system-spacing.minimum-distance = #4
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

elgar_I_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Adagio"
  \key b \major
  \clef violin
  \relative c' {
    % cl1 p1 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-10
        R1*4 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \clef bass
        \stemDown
        <b, g' d'>2\solo <g d' b' g'>2 |
        <es b' g' f'>8[ es''] d es <fis,, d' a' c>4 c''~ |
        c8 b a \acciaccatura c b es,2~ |
        es8 d c \acciaccatura f es { \override Flag.stroke-style = #"grace" \afterGrace d2(\fermata g,8) } |
        \clef violin
      }
    >>
    d''2--\p\<\aTempo g2--\f\breathe |
    f'8->(\pp\rit es d \acciaccatura f es)\breathe r4 r8\fermata r8 |
    R1\collaParte
    r1\fermata\rit |
    \bar "||"
    \mBreak
    
    % cl1 p1 2
    \rMark
    \time 9/8
    \tempo "Moderato"
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*9/8*6 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        a,4(_"Vla." b8 a4 c8 d4 c8) |
        R1*9/8*4 |
        \clef bass
        f,,4(^"Tutti Celli" d8) c4( d8 b4 a8) |
        \clef violin
      }
    >>
    \rMark
    r4. a''4.~\pp a4 r8 |
    r4. g'4.--~ g4 r8 |
    r4. a,4.~ a4 r8 |
    r4. g'4.--~ g4 r8 |
    \mBreak

    % cl1 p1 3
    r4. a,4.~ a4 r8 |
    r4. f4.~ f4 r8 |
    \rMark
    R1*9/8*6
    \rMark
    d2.-^\mf g4.-- |
    f2. a4.-- |
    b4. as4.--\< g |
    g4.~\sf g4\p r8 fis4-- r8 |
    \mBreak

    % cl1 p1 4
    g4.~ g4 r8 b4.( |
    a4)\pocoAllarg r8 r4. r |
    \rMark
    g'4(\ff\aTempo a8 g4 b8 c4-^ b8) |
    a4( f8 es4 f8 d4) r8 |
    b'4( c8)\< b4( d8) es4-^(\! d8) |
    \mBreak

    % cl1 p1 5
    c4( a8 g4 a8 fis4 d8) |
    g4 r8 r4. cis,4-- r8 |
    d4-- r8 r4. r4. |
    \rMark
    a2.~(\pp a4. |
    b2.) r4. |
    R1*9/8*5 |
    R1*9/8\fermata
    \bar "||"
    \mBreak

    % cl1 p1 6
    \time 12/8
    \rMark
    g8(\pp\aTempo[ b) r16 a16(\<] d4 c8)\! es4\tenuto( c8\> b4\! g8~ |
    g8) r r r4. r2. |
    g8([ b)\< r16 a16(] d4 c8)\mf g'4-^( d8)\> c4( g8 |
    e8)\ppp r r r4. r2. |
    R1*12/8*4 |
    \bar "||"
    \mBreak

    % cl1 p1 7
    \key g \major
    \rMark
    r4. e'4(\p\< a8~ a4\! d,8 g4.) |
    fis4.( e4 fis8 d4. cis4 d8 |
    h8) r r r4. r2. |
    fis'4.( e4 fis8 d4. cis4 d8~ |
    \rMark
    d8) r r c4.~( c b4) r8 |
    R1*12/8 |
    \mBreak

    % cl1 p1 8
    b4.(\pp\< d4 c8~ c4\> b8~\! b4) r8 |
    R1*12/8 |
    \rMark
    r2. \pocoString c'8->(\p es,8. g16 d8 fis a |
    g8) r r r4. c8->\p es,8. g16 d8 r r |
    r2. f4.(\pp\rit g,4) r8 |
    \mBreak

    % cl1 p1 9
    \time 6/8
    R1*6/8 |
    \rMark
    \time 12/8
    h8.(\pp c16\< h8 e4 a8) a4(\> d,8\! g4) r8 |
    fis4.( e8\< g8. \> fis16)\! d4.( cis8 e8. d16~ |
    d4) r8 r4. r2. |
    R1*12/8 |
    \mBreak
    \pBreak

    % cl1 p2 1
    \rMark
    e4.~(\f e4 d8) c4.~(\> c4 a8) |
    R1*12/8 |
    b8(\p\<\rit b,8. d16 a8\> cis e\! f4) r8 r4. |
    \time 6/8
    R1*6/8 |
    \bar "||"
    \rMark
    \key b \major
    \time 12/8
    g8(\pp\aTempo b) r16 a(\< d4 c8) g'4-^(\mf d8\> c4 g8)\! |
    \mBreak
  
    % cl1 p2 2
    R1*12/8*2 |
    r2.\collaParte r2.\aTempo |
    R1*12/8 |
    \rMark
    \bar "||"
    \time 9/8
    R1*9/8*3\comePrima
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*9/8 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        b16(_"Vl.I" g fis g a b) c( d es f g a h c d e f g) |
      }
    >>
    a,,2.~\pp a4.~ |
    a4 r8 r4. r4. |
    \mBreak
    
    % cl1 p2 3
    \rMark
    R1*9/8*3 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        \voiceTwo
        \stemUp
        R1*9/8 |
        r4. r4. g4.(\p |
        a4)\inTempo r8 r4. r4. |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        d4^"Solo" d8 es4 fis8 g4( f8) |
        f8->(\larg es) b a->( g) b s4. |
        s2. s4. |
      }
    >>
    \rMark
    g'4(\ff a8 g4 b8 c4 b8) |
    \mBreak
  
    % cl1 p2 4
    a4( f8 es4 f8 f4) r8 |
    b4( c8\< b4 d8 e-!)\ffz r r |
    R1*9/8 |
    r4. r4. b,4.->(\mf |
    a4.~\> a4)\p r8 r4. |
    \rMark
    R1*9/8*7 |
    R1*9/8\fermata
    \bar "||"
    \time 4/4
    \mBreak
  }
}
  
elgar_II_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Lento"
  \key b \major
  \clef violin
  \relative c' {
    % cl1 p2 5
    \mark #18
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \clef bass
        \stemDown
        g,2~\collaParte_"Bassi" g4~ g8.( es16) |
        \clef violin
      }
    >>
    f''2~\p\moltoCresc\accell f4( es8-.)\ff r\fermata |
    \bar "||"
    \override Score.TextMark.self-alignment-X = #CENTER
    \textEndMark \markup { \musicglyph "scripts.ufermata" }
    \tempo "Allegro molto"
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        R1 |
        R1\collaParte\fermata
        R1
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        \repeat tremolo 4 d16-. d( f) f f f( d) d d d( c) c c |
        s1
        \repeat tremolo 4 d16-.\solo\aTempo d( f) f f f(\rit d) d d d( c) c c |
      }
    >>
    \mBreak
  
    % cl1 p2 6
    d'1~\pp\<\fermata |
    d8\>\aTempo r8\! r4 r2\ritenMolto |
    R1\fermata |
    \rMark
    R1\aTempo |
    R1\accell |
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        \voiceOne
        b2\rest\collaParte b2\rest\aTempo
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        s2 r4_"Bassi" c,-.
      }
    >>
    es''4-.\ff s4 s2\fermata 
    \override MultiMeasureRest.staff-position = #2
    \cadenzaOn
    s1^\markup { "CADENZA: " \italic "ends = " } s2 s2
    {
      \tiny \stemDown
      <b,, g'(>4 ges') <as, g'(> f') <a, f'(> fes') <ges, fes'(> <ges es')>\fermata
      \normalsize
      \stemNeutral
    }
    \cadenzaOff
    \revert MultiMeasureRest.staff-position
    \bar "||"
    \mBreak
  
    % cl1 p2 7
    \tempo "Allegro molto"
    R1 |
    R1\fermata\collaParte |
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        \voiceOne
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        d'16-.\piuLento\solo d-. d-. d-. d( f) f f f(\rit d) d d d( cis) cis cis\fermata |
      }
    >>
    \bar "||"
    \textEndMark \markup { \musicglyph "scripts.ufermata" }
    \rMark
    \tempo "Allegro molto"
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        r4 a'-.\p b-. r |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        d,4_"Timp." s4 s2 |
      }
    >>
    R1*2 |
    r2 b'4.->(\pp as8 |
    \mBreak
  
    % cl1 p2 8
    f8) r r4 b4.->( as8) |
    des,4( ges2 b4~ |
    b8) r r4 r2 |
    R1 |
    e8\p r r4 r2 |
    r8 a-.\pp g-. es-. c-. g-. es-. c-. |
    a4( b h c |
    \mBreak
  
    % cl1 p2 9
    cis4\> d es\! e |
    f4) r r2 |
    \rMark
    R1*2 |
    b'4->(\p a g4.\> g,8) |
    f16(\pp g a b a b c d cis\< d e f e f g a |
    b8)\mf r r4 r2 |
    \mBreak
  
    % cl1 p2 10
    R1*4 |
    r4 b,-.\mf r2 |
    R1\pocoAllarg |
    \rMark
    es2(\f\> des\p |
    es,4\<\collaParte f8-.) r des8(\<\aTempo ges b des) |
    es4.(\f f,8) des'4.( ges,8) |
    es8(\< ces'-.)\! b8[ r16 a] b4-. r |
    \mBreak
    \pBreak
  
    % cl1 p3 1
    ges2(\fp\> f |
    ges4\< f8)\! r r2 |
    g'4.(\f e8) f4.( b,8) |
    ges8(\< es'-.) des8\p[ r16 c] des8 r r4 |
    \rMark
    as8-.\p\tempoPrimo r f-. r r2 |
    R1 |
    des4\pp ges2( b4~ |
    \mBreak
    
    % cl1 p3 2
    b8) r r4 r2 |
    R1*2 |
    c16(\ppp h b a as\< g ges f\! e es d des c\> h b a\! |
    \rMark
    b8) r r4 r2 |
    r2 f'4->~\p\> f8\! r |
    R1 |
    \mBreak
    
    % cl1 p3 3
    r2 g4->~\pp\> g8\! r |
    R1*2 |
    r2 r4 b,8(\p\< h |
    c4)\> r\! r2 |
    a4(\p b h\< c\! |
    cis4 d\> es\! e |
    f4) r r2 |
    R1 |
    \mBreak
    
    % cl1 p3 4
    \rMark
    R1*2 |
    b'4->(\p a g4.\< g,8\! |
    f8) r r4 r g'16(\ff as b h |
    c8) r r4 r2 |
    R1 |
    \rMark
    r2 r4 a4-.\p |
    a4-. a-. r2 |
    R1 |
    \mBreak
    
    % cl1 p3 5
    r4 c,-. r2 |
    R1\pocoAllarg |
    \rMark
    d2-^(\f\> c2\p |
    d,4\< e8-.)\! r c(\p\<\aTempo f a c) |
    d4.(\f e,8) c'4.( f,8) |
    d8( b'-.) a8[ r16 gis] a4-. r |
    f2(\fp\> e |
    \mBreak
    
    % cl1 p3 6
    f4\< e8)\! r r2 |
    f'4.(\f dis8) e4.( a,8) |
    f8(\< d'-.) c8\p[ r16 h] c8 r r4 |
    \rMark
    g8\p\tempoPrimo r e r r2 |
    R1 |
    R1\animato |
    f8-.\p r r4 r2 |
    R1 |
    \mBreak
    
    % cl1 p3 7
    es8-. r r4 r2 |
    R1 |
    des8-. r r4 r2 |
    R1 |
    g2(\ppp gis |
    \rMark
    a4) r r2 |
    R1*5 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \acciaccatura c,8 c'8 c4 c'8~ c c4 g'8~ |
        g8 g4 g8~( g8 g,) g-- g-- |
     }
    >>
    \mBreak
    
    % cl1 p3 8
    \rMark
    \time 3/2
    g4.(\ppDolce\aTempo\< a,8 f'4.\! b,8 g[ es'\> d) r16 cis(\!] |
    d2 c b4 h-> |
    d4-.) c-. r2 r2 |
    \bar "||"
    \time 4/4
    d4.(\p e,8 c'4. f,8) |
    d4( b'\< a as\> |
    g4) r4\! r2 |
    \mBreak
    
    % cl1 p3 9
    R1*3 |
    \rMark
    r2\piuMosso f'4-.\pp r |
    ges4 r r2 |
    R1 |
    h1~\pp |
    h1~\> |
    h2\! r |
    R1 |
    \rMark
    R1 |
    \mBreak
    
    % cl1 p3 10
    r2 r4 es,,-. |
    d4-. r f-. r |
    c'---> r h-. r |
    R1*2 |
    \rMark
    R1*2 |
    r2 r8 f8-.\pp b-. f'-. |
    d4-. r r2\fermata |
    \bar "|."
    \mBreak
    \pBreak
    
  }
}

elgar_III_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 3/8
  \tempo "Adagio"
  \key c \major
  \clef violin
  \relative c' {
    % cl1 p4 1
    \mark #34
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R4. |
        \override MultiMeasureRest.staff-position = #4
        R4. |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        \voiceTwo
        f,8(\solo as) des |
        as'8( a b) |
      }
    >>
    R4.*5 |
    \rMark
    R4.*7 |
    \rMark
    R4.*2 |
    <<
      {
        \override MultiMeasureRest.staff-position = #4
        R4.*3 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        \voiceTwo
        b8(\solo c) des~ |
        des8 fes,->( es) |
        d8 c' b |
      }
    >>
    \mBreak
    
    % cl1 p4 2
    dis,4~\pp dis16 r |
    R4.*3 |
    d?4~\pp d16 r |
    R4. |
    \rMark
    r8 r h'8(\p\< |
    c4.\mf |
    h8\> a)\! r |
    R4.*2 |
    R4.*2\stringMolto |
    \mBreak
    
    % cl1 p4 3
    \rMark
    R4.*4 
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R4. |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        \voiceTwo
        cis,8\solo h' a |
      }
    >>
    d,4~\mf\> d16\p r |
    g,4.(\<^"SOLI" |
    as4.\> |
    \rMark
    a4.\!\tempoPrimo\collaParte
    as16)\pp r r8 r |
    R4.*6 |
    \mBreak
    
    % cl1 p4 4
    \rMark
    as'8(\pp ges f~ |
    f8 ges d |
    es8 f b16)\fermata r\fermata |
    c,4~ c16 r\fermata |
    \rMark
    R4.*6 |
    R4.\rit |
    R4.\fermata
    \bar "|."
    \mBreak
  }
}

elgar_IV_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \tempo "Allegro"
  \key b \major
  \clef violin
  \relative c' {
    % cl1 p4 5
    r8 b\p r b |
    R2 |
    r8 des\cresc r\! des |
    R2 |
    r8 e'\p r g |
    r8 g r g |
    r8 g fis4-^ |
    fis8\ff cis'16(\sff d) d8-. r\fermata |
    \bar "||"
    \time 4/4 |
    \tempo "Moderato"
    \mark #42
    g,,1\fp\>\collaParte |
    R1*3\!
    \mBreak
    
    % cl1 p4 6
    b2-^\p\< d-^ |
    a'1~(\pp |
    a2 f) |
    \rMark
    R1 |
    r2 r4.\fermata r8 |
    s4\fermata^\markup{"CADENZA:" \italic "ends ="} s4 s4 s16 \tiny r16\fermata fis,32(\aTempo a fis a) \normalsize |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        \voiceTwo
        r2 r4 fis'!8^.\f r^\fermata |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne
        \stemDown
        c32( es c es) fis( a fis a) c( es c es) dis( \once \omit Accidental fis dis fis) a4~ \once \hideNotes a4 |
      }
    >>
    \bar "||"
    \mBreak
    
    % cl1 p4 7
    \tempo "Allegro ma non troppo"
    \time 2/4 
    \rMark
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        \voiceOne
        R2*7 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        g,,8-> r \acciaccatura g8 b4-^ |
        \acciaccatura { a16 b } a8-! g16 a f8 es16 f |
        R2*3 |
        \acciaccatura { es16 f } es8-! d16 es c8 d16 es |
        d8 es16 f g8 a16 b |
      }
    >>
    c8->\f r\breathe d-. r |
    \rMark
    g,8\ff r \acciaccatura g8 b4-^ |
    \acciaccatura { a16 b } a8-! g16-. a-. f8 es16-. f-. |
    \mBreak
    
    % cl1 p4 8
    d8 r \acciaccatura d8 f4-^ |
    \acciaccatura { es16 f } es8-! d16-. es-. c8\> d16-. es-.\! |
    d8 r r4 |
    r8 g4(\f\> e8)\! |
    R2 |
    r8 h'4(\f\> g8-.)\! |
    r4 f4(\mf |
    \mBreak
    
    % cl1 p4 9
    e4\< d8-!)\sf r | |
    \rMark
    r4 a''-^\f g8 f16 g e8 d16 e |
    c8 r f4-^ |
    es8 des16 es c8 b16 c |
    as8 r des4-^ |
    es4-. ges4-. |
    fes8 r r4 |
    \mBreak
    
    % cl1 p4 10
    as,16(\ff\brillante b c des es f ges g |
    as\< a b c des8)\! r |
    h8 a16 h gis8 fis16 gis |
    e8 r e4-^( |
    f4\dim d\! |
    c8) r r4 |
    \mBreak
    \pBreak
    
    % cl1 p5 1
    r4 as,8.(\mf\< ces16~ |
    ces8\> b a)\! r |
    r4 as8.(\< ces16~ |
    ces8\> b a)\! r |
    R2 |
    \rMark
    R2 |
    R2\fermata\collaParte |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        \voiceOne
        \stemDown
        R2 |
        r4 f''8\p r |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        b,8(\solo a4) b8( |
        es,8) \tuplet 3/2 { f16--([ es-- d--)] } s4 |
      }
    >>
    \mBreak
    
    % cl1 p5 2
    d'16(\> b f b\! f d\< b f)\! |
    ges4->(\< f8)\! r8 |
    R2
    r4 c''8\p r |
    \rMark
    g,16(\f\> b d cis d g b d |
    es8)\p r r4 |
    R2
    r4 a~(\p\< |
    \mBreak
    
    % cl1 p5 3
    a16 gis\! e h\> gis e h\! gis |
    fis4-> f8) r |
    R2 |
    r4 c''~(\mf\< |
    c16\f\> h fis dis\! h8) r |
    \rMark
    R2 |
    r4 g'~(\p\< |
    g8\! as) r4 |
    \mBreak
    
    % cl1 p5 4
    r4 r8 es'~(\mf\< |
    es4\collaParte d8-!) r\fermata
    <<
      {
        \override MultiMeasureRest.staff-position = #4
        \voiceOne
        \stemDown
        R2 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        d8(\solo\aTempo es) b8.( g16) |
      }
    >>
    es4(\p\< d~\! |
    d8\allargando es~\> es4~ |
    es4)\! r |
    R2*2\largamente
    \rMark
    R2*2 \aTempo
    r4 h''8-.\p r |
    R2*3 |
    \mBreak
    
    % cl1 p5 5
    ges8-. r r4 |
    R2*6 |
    f,8-.\p r r4 |
    R2*2\pocoAllarg |
    \rMark
    R2
    R2\accell |
    R2*2\aTempo |
    f2(\p\< |
    a4\>\collaParte es4~\! |
    es4 d8) r |
    \mBreak
    
    % cl1 p5 6
    R2 |
    r4\aTempo b'8-.\p r |
    R2 |
    ges'8-.\p r r4 |
    R2 |
    \rMark
    g2\pEspress\<\allargando |
    c4->( \> as8)\! r |
    R2*2 |
    R2*4\calando |
    \mBreak
    
    % cl1 p5 7
    \rMark
    r4\aTempo as,->(\p |
    b8) a16-. b-. g8-. as16-. b-. |
    ces8 r es4( |
    g8) r r4 |
    R2*4 |
    e8-.\f dis16( e cis b? g e |
    b'8) r r4 |
    e,16(\f cis b? g) r4 |
    \mBreak
    
    % cl1 p5 8
    \rMark
    r4 h-^(\f |
    a8) gis16-. a-. e8\< fis16-. g-.\! |
    gis8-. r h4-^(\p |
    a8) gis16-. a-. e8-. \tuplet 3/2 { fis16( gis a } |
    ais8) r cis4-^(\f |
    h8) ais16-. h-. fis8-.\< gis16-. a-.\! |
    \mBreak
    
    % cl1 p5 9
    ais8-. r cis4-^(\p |
    h8) ais16-. h-. fis8( fis'~ |
    fis8) r r4 |
    R2*3 |
    \rMark
    R2*2\animato |
    ges4(\p\< es |
    b'8)\! r r4 |
    R2*2 |
    b4(\< g\! |
    \mBreak
    
    % cl1 p5 10
    d'8-!) r r4 |
    h4(\pp e4~ |
    e8) r r4 |
    \rMark
    R2 |
    as,8(\f f d as' |
    g8) r es'4->(\f |
    c8) b16-. c-. as-.\< f-. d-. b-.\! |
    R2 |
    \mBreak
    \pBreak
    
    % cl1 p6 1
    r4 as''(\p |
    g8) r r4 |
    R2 |
    \rMark
    f8\p r b4-^~ |
    b8  as16( b ges8) c,-. |
    R2 |
    c8\p r r4 |
    R2*4 |
    d4(\p\< g~\! |
    g8) r r4 |
    \mBreak
    
    % cl1 p6 2
    R2 |
    e8-!\f dis16-. e-. d8-. r |
    fis,8-! e16( fis e cis a his |
    cis8) his16-. cis-. a8->( g |
    \rMark
    gis8) r h4-^(\f |
    a8) gis16-. a-. e8\< fis16-. g-.\! |
    gis8 r r4 |
    R2 |
    \mBreak
    
    % cl1 p6 3
    b8-.\f r \acciaccatura b8 des4-^ |
    \acciaccatura { ces16 des } c8-! b16-. c-. ges8\< as16-. a-. \! |
    b8 r r4 |
    R2*5 |
    g'8\f r h4-^ |
    b8\cresc a16\! b g8 a16 b |
    c8-.\pocoRit es-. g-. b-. |
    \mBreak
    
    % cl1 p6 4
    d,8-.\ff g-. d'-. r\breathe |
    \rMark
    R2*5\tempoPrimo |
    g,,,8(\f a16 g e8 f16 g) |
    a8( h16 cis d8 cis16 d) |
    \tuplet 3/2 {e8.( cis16 a8) } \tuplet 3/2 {g8( a e) } |
    \rMark
    R2*4 |
    r8 c''4->(\f a8) |
    \mBreak
    
    % cl1 p6 5
    R2 |
    e,8(\f fis16 gis a8 gis16 a) |
    h8( a16 h gis8 a16 h) |
    c8 h16 c h8 a16 h |
    c8 h16 c cis8 his16 cis |
    d8 es?16 f g8 as16 b |
    \mBreak
    
    % cl1 p6 6
    c8 des16 es es8 ges16 as |
    \rMark
    b8 r es4-^\ff |
    des8 ces16 des b8 a?16 b |
    ges8 r h4-^ |
    a8 g16 a fis8 e16 fis |
    d8 r r4 |
    \mBreak
    
    % cl1 p6 7
    fis,16( gis ais h cis d e eis |
    fis16 g gis ais h8) r |
    a8 g16 a fis8 eis16 fis |
    d8 r g4-^ |
    fis8 e16 fis d8 cis16 d |
    h8 r e' r |
    \mBreak
    
    % cl1 p6 8
    d8 r h r |
    gis,-> r h-> r |
    gis'8-> r h-> r |
    gis8-> r d'-> r |
    \rMark
    R2\collaParte r2\fermata
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        \voiceOne
        \stemDown
        R2 |
        r4 as8\p r |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        es,8( d4) es8( |
        as,8) \tuplet 3/2 { b16 as g } s4 |
      }
    >>
    \mBreak
    
    % cl1 p6 9
    g''16(\dolce es b g fis g\< es b |
    h4\> c8)\! r |
    R2*2 |
    g16(\p c d es g\< c es g |
    \rMark
    as4.)\> r8\! |
    R2*5 |
    R2*6\allargando |
    \mBreak
    
    % cl1 p6 10
    <<
      {
        \override MultiMeasureRest.staff-position = #-2
        \voiceTwo
        \stemDown
        R2*2\pocoRit |
        \rMark
        r4\aTempo \acciaccatura g,8 b4^^\mf |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne
        \stemUp
        c8(\solo d) fis-.( a-.) |
        c,8-.^"Fl. & Ob." d-. fis-. a-. |
        g8 r s4 |
      }
    >>
    \acciaccatura { a,16 b } a8-! g16-. a-. f8 es16-. f-. |
    d8 r \acciaccatura d8 f4-^ |
    \acciaccatura { es16 f } es8-! d16-. es-. c8 d16-. es-. |
    d8 \cresc r\! \acciaccatura d8 f4-^ |
    \mBreak
    \pBreak
    
    % cl1 p7 1
    \acciaccatura { g16 a } g8-! f16-. g-. e8 f16-. g |
    a8-. r a4(\pp |
    h4 cis |
    a8) r r4 |
    r4 e'4( |
    a,8) r r4 |
    \rMark
    r4 a'->(\p |
    g4 e |
    c4) f->( |
    \mBreak
    
    % cl1 p7 2
    e4 c |
    a4) d->( |
    h4 a |
    e8) r r4 |
    R2*3 |
    r4 d'(\p |
    e8) r r4 |
    R2 |
    e,8\pp r \acciaccatura e8 g4 |
    \mBreak
    
    % cl1 p7 3
    \acciaccatura { f16 g } f8-! e16-. f-. c8-. d16-. dis-. |
    \bar "||"
    \time 4/4
    \rMark
    \tempo "Poco più lento"
    e4-. r r2 |
    R1*3 |
    R1\accell |
    r2 r2\rall |
    r2 r2\aTempo |
    \rMark
    R1*5 |
    \mBreak
    
    % cl1 p7 4
    R1*2\moltoLarg |
    \tempo "Più lento"
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R1*2 |
        \rMark
        \override MultiMeasureRest.staff-position = #4
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        a2.\solo( as4) |
        as2( g4) g |
        d'4-> des-- c ges |
      }
    >>
    des'2(\p\> c4)\! r |
    R1 |
    b2(\p\> a4)\! r |
    R1 |
    e'2(\mf\< es)\! |
    \bar "||"
    \mBreak
    
    % cl1 p7 5
    \time 3/4
    c'4->( ces) b8( ges) |
    b4( a as8 f |
    \rMark
    as4 g\> ges8)\! r |
    \tempo "Più lento"
    b,4.\p\collaParte r8 r4 |
    as4. r8 r4 |
    f4. r8 r4 |
    des4. r8 ges'4\< |
    fes'4->(\f es) des8( b) |
    \mBreak
    
    % cl1 p7 6
    des4( c) a8->(\p\tenuto fis |
    d4) r r |
    r4 r b\p\< |
    \rMark
    as'4->(\ff g) f8( d) |
    f4(\> fes) des8->(\pp\moltoAllarg b |
    ges2.~ |
    ges4) r r |
    R2. |
    \mBreak
    
    % cl1 p7 7
    R2.*2\calando |
    \rMark
    r4\piuTranquillo r g'(\pp |
    ges2.~\> |
    ges2 ces,4 |
    des2)\! r4 |
    \tempo "Lento"
    R2.*4 |
    R2.*2\rit |
    R2.\fermata |
    \bar"||"
    \mBreak
    
    % cl1 p7 8
    \time 4/4
    \tempo "Adagio, come prima"
    \rMark
    <<
      {
        \voiceTwo
        \override MultiMeasureRest.staff-position = #-10
        R1 |
        r2 r4 \clef violin fis4^.\ff
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \clef bass
        \voiceOne
        \stemDown
        <b,,, g' d'>2\solo <g d' b' g'>2 |
        <es b' g' f'>8[ es''] <es,, b' g' d'> es'' <fis,, d' a' c>4 s |
        \clef violin
      }
    >>
    g'''4-. r r2\rit |
    R1\fermata |
    \bar "||"
    \rMark
    \tempo "Allegro molto"
    \time 2/4
    g,,8-.\pp r \acciaccatura g8 b4-- |
    a8-. g16-. a-. fis8-. g16( a |
    g8) r \acciaccatura g8 b4-- |
    \mBreak
    
    % cl1 p7 9
    a8-. g16-. a-. fis8-. g16( a |
    g8) r \acciaccatura g8 b4--\cresc |
    a8-.\! g16( a fis8-.) g16( a |
    g8-.) r b4->( |
    a8)\rit r fis8 r |
    \rMark
    r4\aTempo \acciaccatura g''8 b4-^\ff |
    \acciaccatura { a16 b } a8-! g16 a fis8 g16 a |
    \mBreak
    
    % cl1 p7 10
    b8 c16 d es8 r |
    as,,8 b16 c d8 e16 fis |
    g4-. r |
    d'4-. r |
    g,,2~ |
    g2(\< |
    d'8-.)\!_\markup{ \dynamic "ff sf" } r r4\fermata
    \bar "|."
    \mBreak
  }
}

elgar_I_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Adagio"
  \key b \major
  \clef violin
  \relative c' {
    % cl2 p1 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-10
        R1*4 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \clef bass
        \stemDown
        <b, g' d'>2\solo <g d' b' g'>2 |
        <es b' g' f'>8[ es''] d es <fis,, d' a' c>4 c''~ |
        c8 b a \acciaccatura c b es,2~ |
        es8 d c \acciaccatura f es { \override Flag.stroke-style = #"grace" \afterGrace d2(\fermata g,8) } |
        \clef violin
      }
    >>
    g''2--\p\<\aTempo g2--\f\breathe |
    g2\pp\rit\breathe r4 r8\fermata r8 |
    R1\collaParte
    r1\fermata\rit |
    \bar "||"
    \mBreak
    
    % cl2 p1 2
    \rMark
    \time 9/8
    \tempo "Moderato"
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*9/8*6 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemUp
        a4(_"Vla." b8 a4 c8 d4 c8) |
        R1*9/8*4 |
        \clef bass
        f,,4(^"Tutti Celli" d8) c4( d8 b4 a8) |
        \clef violin
      }
    >>
    \rMark
    r4. es''4.~\pp es4 r8 |
    r4. b'4.--~ b4 r8 |
    r4. es,4.~ es4 r8 |
    \mBreak
    
    % cl2 p1 3
    r4. a,4.~ a4 r8 |
    r4. f4.~ f4 r8 |
    \rMark
    R1*9/8*6
    \rMark
    d2.-^\mf g4.-- |
    f2. a4.-- |
    b4. as4.--\< g |
    g4.~\sf g4\p r8 fis4-- r8 |
    \mBreak

    % cl2 p1 4
    g4.~ g4 r8 b4.( |
    a4)\pocoAllarg r8 r4. r |
    \rMark
    g'4(\ff\aTempo a8 g4 b8 c4-^ b8) |
    a4( f8 es4 f8 d4) r8 |
    b'4( c8)\< b4( d8) es4-^(\! d8) |
    \mBreak

    % cl2 p1 5
    c4( a8 g4 a8 fis4 d8) |
    g4 r8 r4. cis,4-- r8 |
    d4-- r8 r4. r4. |
    \rMark
    a2.~(\pp a4. |
    b2.) r4. |
    R1*9/8*5 |
    R1*9/8\fermata
    \bar "||"
    \mBreak

    % cl2 p1 6
    \time 12/8
    \rMark
    g8(\pp\aTempo[ b) r16 a16(\<] d4 c8)\! es4\tenuto( c8\> b4\! g8~ |
    g8) r r r4. r2. |
    g8([ b)\< r16 a16(] d4 c8)\mf g'4-^( d8)\> c4( g8 |
    e8)\ppp r r r4. r2. |
    R1*12/8*4 |
    \bar "||"
    \mBreak

    % cl2 p1 7
    \key g \major
    \rMark
    r4. e'4(\p\< a8~ a4\! d,8 g4.) |
    fis4.( e4 fis8 d4. cis4 d8 |
    h8) r r r4. r2. |
    fis'4.( e4 fis8 d4. cis4 d8~ |
    \rMark
    d8) r r c4.~( c b4) r8 |
    R1*12/8 |
    \mBreak

    % cl2 p1 8
    b4.(\pp\< d4 c8~ c4\> b8~\! b4) r8 |
    R1*12/8 |
    \rMark
    r2. \pocoString c'8->(\p es,8. g16 d8 fis a |
    g8) r r r4. c8->\p es,8. g16 d8 r r |
    r2. f4.(\pp\rit g,4) r8 |
    \mBreak

    % cl2 p1 9
    \time 6/8
    R1*6/8 |
    \rMark
    \time 12/8
    h8.(\pp c16\< h8 e4 a8) a4(\> d,8\! g4) r8 |
    fis4.( e8\< g8. \> fis16)\! d4.( cis8 e8. d16~ |
    d4) r8 r4. r2. |
    R1*12/8 |
    \mBreak
    \pBreak

    % cl2 p2 1
    \rMark
    e4.~(\f e4 d8) c4.~(\> c4 a8) |
    R1*12/8 |
    b8(\p\<\rit b,8. d16 a8\> cis e\! f4) r8 r4. |
    \time 6/8
    R1*6/8 |
    \bar "||"
    \rMark
    \key b \major
    \time 12/8
    g8(\pp\aTempo b) r16 a(\< d4 c8) g'4-^(\mf d8\> c4 g8)\! |
    \mBreak
  
    % cl2 p2 2
    R1*12/8*2 |
    r2.\collaParte r2.\aTempo |
    R1*12/8 |
    \rMark
    \bar "||"
    \time 9/8
    R1*9/8*3\comePrima
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*9/8 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        b16(_"Vl.I" g fis g a b) c( d es f g a h c d e f g) |
      }
    >>
    a,,2.~\pp a4.~ |
    a4 r8 r4. r4. |
    \mBreak
    
    % cl2 p2 3
    \rMark
    R1*9/8*3 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        \voiceTwo
        \stemUp
        R1*9/8 |
        r4. r4. g4.(\p |
        a4)\inTempo r8 r4. r4. |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        d4^"Solo" d8 es4 fis8 g4( f8) |
        f8->(\larg es) b a->( g) b s4. |
        s2. s4. |
      }
    >>
    \rMark
    g'4(\ff a8 g4 b8 c4 b8) |
    \mBreak
  
    % cl2 p2 4
    a4( f8 es4 f8 f4) r8 |
    b4( c8\< b4 d8 e-!)\ffz r r |
    R1*9/8 |
    r4. r4. b,4.->(\mf |
    a4.~\> a4)\p r8 r4. |
    \rMark
    R1*9/8*7 |
    R1*9/8\fermata
    \bar "||"
    \time 4/4
    \mBreak
  }
}
  
elgar_II_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Lento"
  \key b \major
  \clef violin
  \relative c' {
    % cl2 p2 5
    \mark #18
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \clef bass
        \stemDown
        g,2~\collaParte_"Bassi" g4~ g8.( es16) |
        \clef violin
      }
    >>
    f''2~\p\moltoCresc\accell f4( es8-.)\ff r\fermata |
    \bar "||"
    \override Score.TextMark.self-alignment-X = #CENTER
    \textEndMark \markup { \musicglyph "scripts.ufermata" }
    \tempo "Allegro molto"
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        R1 |
        R1\collaParte\fermata
        R1
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        \repeat tremolo 4 d16-. d( f) f f f( d) d d d( c) c c |
        s1
        \repeat tremolo 4 d16-.\solo\aTempo d( f) f f f(\rit d) d d d( c) c c |
      }
    >>
    \mBreak
  
    % cl2 p2 6
    d'1~\pp\<\fermata |
    d8\>\aTempo r8\! r4 r2\ritenMolto |
    R1\fermata |
    \rMark
    R1\aTempo |
    R1\accell |
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        \voiceOne
        b2\rest\collaParte b2\rest\aTempo
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        s2 r4_"Bassi" c,-.
      }
    >>
    es''4-.\ff s4 s2\fermata 
    \override MultiMeasureRest.staff-position = #2
    \cadenzaOn
    s1^\markup { "CADENZA: " \italic "ends = " } s2 s2
    {
      \tiny \stemDown
      <b,, g'(>4 ges') <as, g'(> f') <a, f'(> fes') <ges, fes'(> <ges es')>\fermata
      \normalsize
      \stemNeutral
    }
    \cadenzaOff
    \revert MultiMeasureRest.staff-position
    \bar "||"
    \mBreak
  
    % cl2 p2 7
    \tempo "Allegro molto"
    R1 |
    R1\fermata\collaParte |
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        \voiceOne
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        d'16-.\piuLento\solo d-. d-. d-. d( f) f f f(\rit d) d d d( cis) cis cis\fermata |
      }
    >>
    \bar "||"
    \textEndMark \markup { \musicglyph "scripts.ufermata" }
    \rMark
    \tempo "Allegro molto"
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        r4 a'-.\p b-. r |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        d,4_"Timp." s4 s2 |
      }
    >>
    R1*2 |
    r2 b'4.->(\pp as8 |
    \mBreak
  
    % cl2 p2 8
    f8) r r4 b4.->( as8) |
    des,4( ges2 b4~ |
    b8) r r4 r2 |
    R1 |
    e8\p r r4 r2 |
    r8 a-.\pp g-. es-. c-. g-. es-. c-. |
    a4( b h c |
    \mBreak
  
    % cl2 p2 9
    cis4\> d es\! e |
    f4) r r2 |
    \rMark
    R1*2 |
    b'4->(\p a g4.\> g,8) |
    f16(\pp g a b a b c d cis\< d e f e f g a |
    b8)\mf r r4 r2 |
    \mBreak
  
    % cl2 p2 10
    R1*4 |
    r4 b,-.\mf r2 |
    R1\pocoAllarg |
    \rMark
    es2(\f\> des\p |
    es,4\<\collaParte f8-.) r des8(\<\aTempo ges b des) |
    es4.(\f f,8) des'4.( ges,8) |
    es8(\< ces'-.)\! b8[ r16 a] b4-. r |
    \mBreak
    \pBreak
  
    % cl2 p3 1
    ges2(\fp\> f |
    ges4\< f8)\! r r2 |
    g'4.(\f e8) f4.( b,8) |
    ges8(\< es'-.) des8\p[ r16 c] des8 r r4 |
    \rMark
    as8-.\p\tempoPrimo r f-. r r2 |
    R1 |
    des4\pp ges2( b4~ |
    \mBreak
    
    % cl2 p3 2
    b8) r r4 r2 |
    R1*2 |
    c16(\ppp h b a as\< g ges f\! e es d des c\> h b a\! |
    \rMark
    b8) r r4 r2 |
    r2 f'4->~\p\> f8\! r |
    R1 |
    \mBreak
    
    % cl2 p3 3
    r2 g4->~\pp\> g8\! r |
    R1*2 |
    r2 r4 b,8(\p\< h |
    c4)\> r\! r2 |
    a4(\p b h\< c\! |
    cis4 d\> es\! e |
    f4) r r2 |
    R1 |
    \mBreak
    
    % cl2 p3 4
    \rMark
    R1*2 |
    b'4->(\p a g4.\< g,8\! |
    f8) r r4 r g'16(\ff as b h |
    c8) r r4 r2 |
    R1 |
    \rMark
    r2 r4 a4-.\p |
    a4-. a-. r2 |
    R1 |
    \mBreak
    
    % cl2 p3 5
    r4 c,-. r2 |
    R1\pocoAllarg |
    \rMark
    d2-^(\f\> c2\p |
    d,4\< e8-.)\! r c(\p\<\aTempo f a c) |
    d4.(\f e,8) c'4.( f,8) |
    d8( b'-.) a8[ r16 gis] a4-. r |
    f2(\fp\> e |
    \mBreak
    
    % cl2 p3 6
    f4\< e8)\! r r2 |
    f'4.(\f dis8) e4.( a,8) |
    f8(\< d'-.) c8\p[ r16 h] c8 r r4 |
    \rMark
    g8\p\tempoPrimo r e r r2 |
    R1 |
    R1\animato |
    f8-.\p r r4 r2 |
    R1 |
    \mBreak
    
    % cl2 p3 7
    es8-. r r4 r2 |
    R1 |
    des8-. r r4 r2 |
    R1 |
    g2(\ppp gis |
    \rMark
    a4) r r2 |
    R1*5 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*2 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \acciaccatura c,8 c'8 c4 c'8~ c c4 g'8~ |
        g8 g4 g8~( g8 g,) g-- g-- |
     }
    >>
    \mBreak
    
    % cl2 p3 8
    \rMark
    \time 3/2
    g4.(\ppDolce\aTempo\< a,8 f'4.\! b,8 g[ es'\> d) r16 cis(\!] |
    d2 c b4 h-> |
    d4-.) c-. r2 r2 |
    \bar "||"
    \time 4/4
    d4.(\p e,8 c'4. f,8) |
    d4( b'\< a as\> |
    g4) r4\! r2 |
    \mBreak
    
    % cl2 p3 9
    R1*3 |
    \rMark
    r2\piuMosso f'4-.\pp r |
    ges4 r r2 |
    R1 |
    h1~\pp |
    h1~\> |
    h2\! r |
    R1 |
    \rMark
    R1 |
    \mBreak
    
    % cl2 p3 10
    r2 r4 es,,-. |
    d4-. r f-. r |
    c'---> r h-. r |
    R1*2 |
    \rMark
    R1*2 |
    r2 r8 f8-.\pp b-. f'-. |
    d4-. r r2\fermata |
    \bar "|."
    \mBreak
    \pBreak
    
  }
}

elgar_III_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 3/8
  \tempo "Adagio"
  \key c \major
  \clef violin
  \relative c' {
    % cl2 p4 1
    \mark #34
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R4. |
        \override MultiMeasureRest.staff-position = #4
        R4. |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        \voiceTwo
        f,8(\solo as) des |
        as'8( a b) |
      }
    >>
    R4.*5 |
    \rMark
    R4.*7 |
    \rMark
    R4.*2 |
    <<
      {
        \override MultiMeasureRest.staff-position = #4
        R4.*3 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        \voiceTwo
        b8(\solo c) des~ |
        des8 fes,->( es) |
        d8 c' b |
      }
    >>
    \mBreak
    
    % cl2 p4 2
    dis,4~\pp dis16 r |
    R4.*3 |
    d?4~\pp d16 r |
    R4. |
    \rMark
    r8 r h'8(\p\< |
    c4.\mf |
    h8\> a)\! r |
    R4.*2 |
    R4.*2\stringMolto |
    \mBreak
    
    % cl2 p4 3
    \rMark
    R4.*4 
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R4. |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \stemDown
        \voiceTwo
        cis,8\solo h' a |
      }
    >>
    d,4~\mf\> d16\p r |
    g,4.(\<^"SOLI" |
    as4.\> |
    \rMark
    a4.\!\tempoPrimo\collaParte
    as16)\pp r r8 r |
    R4.*6 |
    \mBreak
    
    % cl2 p4 4
    \rMark
    as'8(\pp ges f~ |
    f8 ges d |
    es8 f b16)\fermata r\fermata |
    c,4~ c16 r\fermata |
    \rMark
    R4.*6 |
    R4.\rit |
    R4.\fermata
    \bar "|."
    \mBreak
  }
}

elgar_IV_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 2/4
  \tempo "Allegro"
  \key b \major
  \clef violin
  \relative c' {
    % cl2 p4 5
    r8 b\p r b |
    R2 |
    r8 des\cresc r\! des |
    R2 |
    r8 e'\p r g |
    r8 g r g |
    r8 g fis4-^ |
    fis8\ff cis'16(\sff d) d8-. r\fermata |
    \bar "||"
    \time 4/4 |
    \tempo "Moderato"
    \mark #42
    g,,1\fp\>\collaParte |
    R1*3\!
    \mBreak
    
    % cl2 p4 6
    b2-^\p\< d-^ |
    a'1~(\pp |
    a2 f) |
    \rMark
    R1 |
    r2 r4.\fermata r8 |
    s4\fermata^\markup{"CADENZA:" \italic "ends ="} s4 s4 s16 \tiny r16\fermata fis,32(\aTempo a fis a) \normalsize |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        \voiceTwo
        r2 r4 fis'!8^.\f r^\fermata |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne
        \stemDown
        c32( es c es) fis( a fis a) c( es c es) dis( \once \omit Accidental fis dis fis) a4~ \once \hideNotes a4 |
      }
    >>
    \bar "||"
    \mBreak
    
    % cl2 p4 7
    \tempo "Allegro ma non troppo"
    \time 2/4 
    \rMark
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        \voiceOne
        R2*7 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        g,,8-> r \acciaccatura g8 b4-^ |
        \acciaccatura { a16 b } a8-! g16 a f8 es16 f |
        R2*3 |
        \acciaccatura { es16 f } es8-! d16 es c8 d16 es |
        d8 es16 f g8 a16 b |
      }
    >>
    c8->\f r\breathe d-. r |
    \rMark
    g,8\ff r \acciaccatura g8 b4-^ |
    \acciaccatura { a16 b } a8-! g16-. a-. f8 es16-. f-. |
    \mBreak
    
    % cl2 p4 8
    d8 r \acciaccatura d8 f4-^ |
    \acciaccatura { es16 f } es8-! d16-. es-. c8\> d16-. es-.\! |
    d8 r r4 |
    r8 g4(\f\> e8)\! |
    R2 |
    r8 h'4(\f\> g8-.)\! |
    r4 f4(\mf |
    \mBreak
    
    % cl2 p4 9
    e4\< d8-!)\sf r | |
    \rMark
    r4 a''-^\f g8 f16 g e8 d16 e |
    c8 r f4-^ |
    es8 des16 es c8 b16 c |
    as8 r des4-^ |
    es4-. ges4-. |
    fes8 r r4 |
    \mBreak
    
    % cl2 p4 10
    as,16(\ff\brillante b c des es f ges g |
    as\< a b c des8)\! r |
    h8 a16 h gis8 fis16 gis |
    e8 r e4-^( |
    f4\dim d\! |
    c8) r r4 |
    \mBreak
    \pBreak
    
    % cl2 p5 1
    r4 as,8.(\mf\< ces16~ |
    ces8\> b a)\! r |
    r4 as8.(\< ces16~ |
    ces8\> b a)\! r |
    R2 |
    \rMark
    R2 |
    R2\fermata\collaParte |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        \voiceOne
        \stemDown
        R2 |
        r4 f''8\p r |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        b,8(\solo a4) b8( |
        es,8) \tuplet 3/2 { f16--([ es-- d--)] } s4 |
      }
    >>
    \mBreak
    
    % cl2 p5 2
    d'16(\> b f b\! f d\< b f)\! |
    ges4->(\< f8)\! r8 |
    R2
    r4 c''8\p r |
    \rMark
    g,16(\f\> b d cis d g b d |
    es8)\p r r4 |
    R2
    r4 a~(\p\< |
    \mBreak
    
    % cl2 p5 3
    a16 gis\! e h\> gis e h\! gis |
    fis4-> f8) r |
    R2 |
    r4 c''~(\mf\< |
    c16\f\> h fis dis\! h8) r |
    \rMark
    R2 |
    r4 g'~(\p\< |
    g8\! as) r4 |
    \mBreak
    
    % cl2 p5 4
    r4 r8 es'~(\mf\< |
    es4\collaParte d8-!) r\fermata
    <<
      {
        \override MultiMeasureRest.staff-position = #4
        \voiceOne
        \stemDown
        R2 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        d8(\solo\aTempo es) b8.( g16) |
      }
    >>
    es4(\p\< d~\! |
    d8\allargando es~\> es4~ |
    es4)\! r |
    R2*2\largamente
    \rMark
    R2*2 \aTempo
    r4 h''8-.\p r |
    R2*3 |
    \mBreak
    
    % cl2 p5 5
    ges8-. r r4 |
    R2*6 |
    f,8-.\p r r4 |
    R2*2\pocoAllarg |
    \rMark
    R2
    R2\accell |
    R2*2\aTempo |
    f2(\p\< |
    a4\>\collaParte es4~\! |
    es4 d8) r |
    \mBreak
    
    % cl2 p5 6
    R2 |
    r4\aTempo b'8-.\p r |
    R2 |
    ges'8-.\p r r4 |
    R2 |
    \rMark
    g2\pEspress\<\allargando |
    c4->( \> as8)\! r |
    R2*2 |
    R2*4\calando |
    \mBreak
    
    % cl2 p5 7
    \rMark
    r4\aTempo as,->(\p |
    b8) a16-. b-. g8-. as16-. b-. |
    ces8 r es4( |
    g8) r r4 |
    R2*4 |
    e8-.\f dis16( e cis b? g e |
    b'8) r r4 |
    e,16(\f cis b? g) r4 |
    \mBreak
    
    % cl2 p5 8
    \rMark
    r4 h-^(\f |
    a8) gis16-. a-. e8\< fis16-. g-.\! |
    gis8-. r h4-^(\p |
    a8) gis16-. a-. e8-. \tuplet 3/2 { fis16( gis a } |
    ais8) r cis4-^(\f |
    h8) ais16-. h-. fis8-.\< gis16-. a-.\! |
    \mBreak
    
    % cl2 p5 9
    ais8-. r cis4-^(\p |
    h8) ais16-. h-. fis8( fis'~ |
    fis8) r r4 |
    R2*3 |
    \rMark
    R2*2\animato |
    ges4(\p\< es |
    b'8)\! r r4 |
    R2*2 |
    b4(\< g\! |
    \mBreak
    
    % cl2 p5 10
    d'8-!) r r4 |
    h4(\pp e4~ |
    e8) r r4 |
    \rMark
    R2 |
    as,8(\f f d as' |
    g8) r es'4->(\f |
    c8) b16-. c-. as-.\< f-. d-. b-.\! |
    R2 |
    \mBreak
    \pBreak
    
    % cl2 p6 1
    r4 as''(\p |
    g8) r r4 |
    R2 |
    \rMark
    f8\p r b4-^~ |
    b8  as16( b ges8) c,-. |
    R2 |
    c8\p r r4 |
    R2*4 |
    d4(\p\< g~\! |
    g8) r r4 |
    \mBreak
    
    % cl2 p6 2
    R2 |
    e8-!\f dis16-. e-. d8-. r |
    fis,8-! e16( fis e cis a his |
    cis8) his16-. cis-. a8->( g |
    \rMark
    gis8) r h4-^(\f |
    a8) gis16-. a-. e8\< fis16-. g-.\! |
    gis8 r r4 |
    R2 |
    \mBreak
    
    % cl2 p6 3
    b8-.\f r \acciaccatura b8 des4-^ |
    \acciaccatura { ces16 des } c8-! b16-. c-. ges8\< as16-. a-. \! |
    b8 r r4 |
    R2*5 |
    g'8\f r h4-^ |
    b8\cresc a16\! b g8 a16 b |
    c8-.\pocoRit es-. g-. b-. |
    \mBreak
    
    % cl2 p6 4
    d,8-.\ff g-. d'-. r\breathe |
    \rMark
    R2*5\tempoPrimo |
    g,,,8(\f a16 g e8 f16 g) |
    a8( h16 cis d8 cis16 d) |
    \tuplet 3/2 {e8.( cis16 a8) } \tuplet 3/2 {g8( a e) } |
    \rMark
    R2*4 |
    r8 c''4->(\f a8) |
    \mBreak
    
    % cl2 p6 5
    R2 |
    e,8(\f fis16 gis a8 gis16 a) |
    h8( a16 h gis8 a16 h) |
    c8 h16 c h8 a16 h |
    c8 h16 c cis8 his16 cis |
    d8 es?16 f g8 as16 b |
    \mBreak
    
    % cl2 p6 6
    c8 des16 es es8 ges16 as |
    \rMark
    b8 r es4-^\ff |
    des8 ces16 des b8 a?16 b |
    ges8 r h4-^ |
    a8 g16 a fis8 e16 fis |
    d8 r r4 |
    \mBreak
    
    % cl2 p6 7
    fis,16( gis ais h cis d e eis |
    fis16 g gis ais h8) r |
    a8 g16 a fis8 eis16 fis |
    d8 r g4-^ |
    fis8 e16 fis d8 cis16 d |
    h8 r e' r |
    \mBreak
    
    % cl2 p6 8
    d8 r h r |
    gis,-> r h-> r |
    gis'8-> r h-> r |
    gis8-> r d'-> r |
    \rMark
    R2\collaParte r2\fermata
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        \voiceOne
        \stemDown
        R2 |
        r4 as8\p r |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        es,8( d4) es8( |
        as,8) \tuplet 3/2 { b16 as g } s4 |
      }
    >>
    \mBreak
    
    % cl2 p6 9
    g''16(\dolce es b g fis g\< es b |
    h4\> c8)\! r |
    R2*2 |
    g16(\p c d es g\< c es g |
    \rMark
    as4.)\> r8\! |
    R2*5 |
    R2*6\allargando |
    \mBreak
    
    % cl2 p6 10
    <<
      {
        \override MultiMeasureRest.staff-position = #-2
        \voiceTwo
        \stemDown
        R2*2\pocoRit |
        \rMark
        r4\aTempo \acciaccatura g,8 b4^^\mf |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceOne
        \stemUp
        c8(\solo d) fis-.( a-.) |
        c,8-.^"Fl. & Ob." d-. fis-. a-. |
        g8 r s4 |
      }
    >>
    \acciaccatura { a,16 b } a8-! g16-. a-. f8 es16-. f-. |
    d8 r \acciaccatura d8 f4-^ |
    \acciaccatura { es16 f } es8-! d16-. es-. c8 d16-. es-. |
    d8 \cresc r\! \acciaccatura d8 f4-^ |
    \mBreak
    \pBreak
    
    % cl2 p7 1
    \acciaccatura { g16 a } g8-! f16-. g-. e8 f16-. g |
    a8-. r a4(\pp |
    h4 cis |
    a8) r r4 |
    r4 e'4( |
    a,8) r r4 |
    \rMark
    r4 a'->(\p |
    g4 e |
    c4) f->( |
    \mBreak
    
    % cl2 p7 2
    e4 c |
    a4) d->( |
    h4 a |
    e8) r r4 |
    R2*3 |
    r4 d'(\p |
    e8) r r4 |
    R2 |
    e,8\pp r \acciaccatura e8 g4 |
    \mBreak
    
    % cl2 p7 3
    \acciaccatura { f16 g } f8-! e16-. f-. c8-. d16-. dis-. |
    \bar "||"
    \time 4/4
    \rMark
    \tempo "Poco più lento"
    e4-. r r2 |
    R1*3 |
    R1\accell |
    r2 r2\rall |
    r2 r2\aTempo |
    \rMark
    R1*5 |
    \mBreak
    
    % cl2 p7 4
    R1*2\moltoLarg |
    \tempo "Più lento"
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R1*2 |
        \rMark
        \override MultiMeasureRest.staff-position = #4
        R1 |
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \voiceTwo
        \stemDown
        a2.\solo( as4) |
        as2( g4) g |
        d'4-> des-- c ges |
      }
    >>
    des'2(\p\> c4)\! r |
    R1 |
    b2(\p\> a4)\! r |
    R1 |
    e'2(\mf\< es)\! |
    \bar "||"
    \mBreak
    
    % cl2 p7 5
    \time 3/4
    c'4->( ces) b8( ges) |
    b4( a as8 f |
    \rMark
    as4 g\> ges8)\! r |
    \tempo "Più lento"
    b,4.\p\collaParte r8 r4 |
    as4. r8 r4 |
    f4. r8 r4 |
    des4. r8 ges'4\< |
    fes'4->(\f es) des8( b) |
    \mBreak
    
    % cl2 p7 6
    des4( c) a8->(\p\tenuto fis |
    d4) r r |
    r4 r b\p\< |
    \rMark
    as'4->(\ff g) f8( d) |
    f4(\> fes) des8->(\pp\moltoAllarg b |
    ges2.~ |
    ges4) r r |
    R2. |
    \mBreak
    
    % cl2 p7 7
    R2.*2\calando |
    \rMark
    r4\piuTranquillo r g'(\pp |
    ges2.~\> |
    ges2 ces,4 |
    des2)\! r4 |
    \tempo "Lento"
    R2.*4 |
    R2.*2\rit |
    R2.\fermata |
    \bar"||"
    \mBreak
    
    % cl2 p7 8
    \time 4/4
    \tempo "Adagio, come prima"
    \rMark
    <<
      {
        \voiceTwo
        \override MultiMeasureRest.staff-position = #-10
        R1 |
        r2 r4 \clef violin fis4^.\ff
        \revert MultiMeasureRest.staff-position
      }
      \\
      \new CueVoice {
        \clef bass
        \voiceOne
        \stemDown
        <b,,, g' d'>2\solo <g d' b' g'>2 |
        <es b' g' f'>8[ es''] <es,, b' g' d'> es'' <fis,, d' a' c>4 s |
        \clef violin
      }
    >>
    g'''4-. r r2\rit |
    R1\fermata |
    \bar "||"
    \rMark
    \tempo "Allegro molto"
    \time 2/4
    g,,8-.\pp r \acciaccatura g8 b4-- |
    a8-. g16-. a-. fis8-. g16( a |
    g8) r \acciaccatura g8 b4-- |
    \mBreak
    
    % cl2 p7 9
    a8-. g16-. a-. fis8-. g16( a |
    g8) r \acciaccatura g8 b4--\cresc |
    a8-.\! g16( a fis8-.) g16( a |
    g8-.) r b4->( |
    a8)\rit r fis8 r |
    \rMark
    r4\aTempo \acciaccatura g''8 b4-^\ff |
    \acciaccatura { a16 b } a8-! g16 a fis8 g16 a |
    \mBreak
    
    % cl2 p7 10
    b8 c16 d es8 r |
    as,,8 b16 c d8 e16 fis |
    g4-. r |
    d'4-. r |
    g,,2~ |
    g2(\< |
    d'8-.)\!_\markup{ \dynamic "ff sf" } r r4\fermata
    \bar "|."
    \mBreak
  }
}

% ---------------------------------------------------------

%{
\book {
  \bookOutputSuffix "1"
  \paper {
    print-all-headers = ##t
  }
  \header {
    instrument = "Klarinette I in A"
  }
  
  \bookpart {
    \score {
      \header {
        title = "I"
        instrument = ##f
        composer = ##f
      }
      \new Staff {
        \transpose a a \elgar_I_clarinet_I
      }
    }
    \score {
      \header {
        title = "II"
        instrument = ##f
        composer = ##f
      }
      \new Staff {
        \transpose a a \elgar_II_clarinet_I
      }
    }
    \score {
      \header {
        title = "III"
        instrument = ##f
        composer = ##f
      }
      \new Staff {
        \transpose a a \elgar_III_clarinet_I
      }
    }
    \score {
      \header {
        title = "IV"
        instrument = ##f
        composer = ##f
      }
      \new Staff {
        \transpose a a \elgar_IV_clarinet_I
      }
    }
  }
}
%}
  
%%{
\book {
  \bookOutputSuffix "2"
  \paper {
    print-all-headers = ##t
  }
  \header {
    instrument = "Klarinette II in A"
  }
  
  \bookpart {
    \score {
      \header {
        title = "I"
        instrument = ##f
        composer = ##f
      }
      \new Staff {
        \transpose a a \elgar_I_clarinet_II
      }
    }
    \score {
      \header {
        title = "II"
        instrument = ##f
        composer = ##f
      }
      \new Staff {
        \transpose a a \elgar_II_clarinet_II
      }
    }
    \score {
      \header {
        title = "III"
        instrument = ##f
        composer = ##f
      }
      \new Staff {
        \transpose a a \elgar_III_clarinet_II
      }
    }
    \score {
      \header {
        title = "IV"
        instrument = ##f
        composer = ##f
      }
      \new Staff {
        \transpose a a \elgar_IV_clarinet_II
      }
    }
  }
}
%%}
