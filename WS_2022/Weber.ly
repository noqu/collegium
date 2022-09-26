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
% mBreak = {}
mBreak = { \break }
#(set-global-staff-size 17)

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
tutti = ^\markup { "Tutti" }
piuF = _\markup { \italic "più" \dynamic f }
piuP = _\markup { \italic "più" \dynamic p }
lento = ^\markup { \italic "Lento" }
accel = ^\markup { \bold { "accel." } }
tempoPrimo = ^\markup { \italic { "Tempo I" } }
cadenza = ^\markup { \italic {"Cadenza"} }

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
  \set Score.markFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 4/4
  \tempo "Adagio"
  \key c \major
  \clef violin
  \relative c' {
    % p1 1
    \tutti
    g''1\ff~ |
    g2 r \fermata |
    d1\pp\<~ |
    d2\> r\! \fermata
    \mark #1
    \time 6/8
    \tempo "Andante"
    \solo
    R1*6/8*6 |
    a2.(\p |
    b4. f |
    g4. es |
    \mBreak
    
    % p1 2
    d4.) r |
    R1*6/8*7 |
    r8 d'(\pp d d cis c |
    b8) r8 r r4. |
    r8 d( d d cis c |
    b8) r8 r r4. |
    R1*6/8 |
    R1*6/8  \fermataMarkup |
    \bar "||"
    \mBreak
    
    % p1 3
    \mark #2
    \time 2/4
    \tempo "Andante con moto"
    \key g \major
    \repeat volta 2 {
      R1*2/4*8
    }
    \mark #3
    \repeat volta 2 {
      R1*2/4*8
    }
    \mark #4
    \tutti
    h'4(\f g) |
    e8( fis g a) |
    \slashedGrace g8 fis8-. e-. fis4 |
    g4( d) |
    h'4( g) |
    e8( fis g a) |
    \mBreak
    
    % p1 4
    \slashedGrace g8 fis8-. e-. fis4 |
    g4. r8 |
    \mark #5
    \solo
    \repeat volta 2 {
      R1*2/4*8
    }
    \mark #6
    \repeat volta 2 {
      R1*2/4*8
    }
    \mark #7
    \tutti
    <<
      {
        \override MultiMeasureRest.staff-position = #0
        R1*2/4 |
        r4 r8 c,\p |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Viol.I"
        \stemUp {
          c'8^( h a g |
          fis8 e d) 
        }
      }
    >>
    h( c d e |
    h4 a8) r |
    R1*2/4*4 |
    \mBreak
    
    % p1 5
    \mark #8
    \solo
    \repeat volta 2 {
      g'8\f r r4 |
      R1*2/4 |
      a8\f r r a |
      g8 r r4 |
      g8\f r r4 |
      R1*2/4 |
      a8\f r r a |
      g8 r r4 |
    }
    \mark #9
    \repeat volta 4 {
      R1*2/4*4 |
    \mBreak
    
    % p1 6
      g8\f r r4 |
      R1*2/4 |
      a8\f r r a |
      g8 r r4 |
    }
    \mark #10
    \tutti
    fis4->(\ff g8) r |
    R1*2/4 |
    a8\p a a a |
    g2 |
    fis4(->\ff g8) r |
    R1*2/4 |
    \mBreak
    
    % p1 7
    a8\p a a a |
    \mark #11
    \solo
    \repeat volta 2 {
      g4 r |
      R1*2/4*7 |
    }
    \mark #12
    \repeat volta 2 {
      R1*2/4*8 |
    }
    \mark #13
    \tutti
    R1*2/4*7
    \mark #14
    \repeat volta 2 {
      <<
        {
          \solo
          \override MultiMeasureRest.staff-position = #-4
          R1*2/4 |
          r8. h,16-.\p\< \grace d32 c16-. h-. c8~\! |
          \revert MultiMeasureRest.staff-position
        }
        \new CueVoice {
          \set instrumentCueName = "Viol.I"
          \stemUp {
            h16 h[ h h] h h h h|
            r32 e[ a h] c16
          }
        }
      >>
      \mBreak
      
      %p1 8
      c,8 r r4 |
      r16 d-.\< g-. h-. d-.\> h-. c-. a-.\! |
      h8 r r4 |
      r8. h,16-.\< c-. h-. c8~\! |
      c8 r r4 |
      r16 h'-.\p g-. h-. g8 r |
    }
    \mark #15
    \repeat volta 2 {
      fis8\f r g r |
      \mBreak
      
      %p1 9
      fis8 r r4 |
      R1*2/4 |
      d32\ff( e fis g a h c h a g fis e d c h a) |
      g8 r r4 |
      r8. h16-.\p\< c-. h-. c8~\! |
      c8 r r4 |
      \mBreak

      %p1 10
      r16 d-.\< g-. h-. d-.\> h-. c-. a-.\! |
      h8 r r4 |
      r8. h,16-.\< c-. h-. c8~\! |
      c8 r r4 |
      r16 h'-.\p g-. h-. g8-. r |
    }
    \mark #16
    \tutti
    h2~\ff |
    h2~ |
    h2 |
    c2 |
    \mBreak

    % p1 10
    r16 fis,( g a b a b g) |
    fis8 fis4.~ |
    fis2~ |
    \mark #17
    \bar "||"
    \time 4/4
    fis4 r\fermata ^\markup { "Recit." } \solo r2 |
    R1*8 |
    \mark #18
    R1*16 |
    \mark #19
    R1\fermataMarkup\cadenza
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R1 |
        R1\fermataMarkup |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Timp."
        \clef bass
        \stemDown {
          d,,1 |
          d4 r r2\fermata |
        }
      }
    >>
    \clef violin
    \bar "||"
    \mBreak
    
    % p2 1
    \time 3/4
    \mark #20
    \tempo "Polacca"
    \solo
    R1*3/4*8 |
    \mark #21
    \tutti
    h'''8\ff \repeat unfold 5 { h8 } |
    r8 \repeat unfold 5 { c8 } |
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 h'8 h4-> |
    h8 \repeat unfold 5 { h8 } |
    r8 \repeat unfold 5 { c8 } |
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \mBreak
    
    % p2 2
    \repeat unfold 4 h'8 h4-> |
    \mark #22
    \solo
    R1*3/4*8 |
    \mark #23
    \tutti
    r8 fis\ff fis fis g g |
    r8 \repeat unfold 5 { fis } |
    r8 \repeat unfold 3 f e e |
    d8 fis4-> \repeat unfold 3 fis8 |
    r8 \repeat unfold 5 h |
    r8 \repeat unfold 5 c |
    \mBreak
    
    % p2 3
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 h'8 h4 |
    \mark #24
    \solo
    R1*3/4*2 |
    c2.(\p |
    h8) r8 r4 r |
    R1*3/4*4 |
    \mark #25
    R1*3/4*4 |
    \tutti
    fis2.(\f |
    g2.)~ |
    g4 r r |
    R1*3/4 |
    \mark #26
    \solo
    R1*3/4*3 |
    \mBreak
    
    % p2 4
    r8 c,8-.(\pp \repeat unfold 3 c-. c-.)|
    R1*3/4*4 |
    \mark #27
    \solo
    R1*3/4*1 |
    r8 g'16(\p fis f e f d c h \grace h32 a16 g) |
    R1*3/4*6 |
    \mark #28
    R1*3/4*3 |
    \tutti
    r8 \grace { as'32 g fis } g8\ff r g\turn r g\turn |
    r8 b8 r b g,4-> |
    R1*3/4*2 |
    \mBreak
    
    % p2 5
    r8 \grace { as'32 g fis } g8\ff r g\turn r g\turn |
    r8 b8 r b g,4-> |
    R1*3/4*2 |
    \mark #29
    es'2.\ff |
    as2. |
    g2. |
    \repeat unfold 4 f8 f4-> |
    \mBreak
    
    % p2 6
    \solo
    es,8\p b''4->( a16 b c b as g) |
    as8-. c4( h16 c d c b as) |
    g4. es16 g g fis es d |
    d8 d16 es d4(-> es8) r |
    \mBreak
    
    % p2 7
    \mark #30
    es,8 b''4->( a16 b c b as g) |
    as8-. c4( h16 c d c b as) |
    g8 b4 g16 b b as g fis |
    \repeat unfold 4 f8 g r |
    g2\ff as8 c |
    \mBreak
    
    % p2 8
    b2. |
    b4. g8 as c |
    b2.~\> |
    b2.~ |
    b4\! r r |
    R1*3/4*3 |
    \mark #31
    \solo
    R1*3/4*8 |
    \mark #32
    \tutti
    h8\ff \repeat unfold 5 h8 |
    r8 \repeat unfold 5 c |
    \mBreak
    
    % p2 9
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 h'8 h4-> |
    r8 \repeat unfold 5 h8 |
    r8 \repeat unfold 5 c |
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 h'8 h4-> |
    \mark #33
    R1*3/4*8 |
    \mark #34
    R1*3/4*11 |
    \mBreak
    
    % p2 10
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        R1*3/4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Cor. primo"
        \stemUp {
          c,4. g'16 e c g e c |
        }
      }
    >>
    \mark #35
    r8 g'-.\pp\< h-. d-. g-. h-.\! |
    d4-. r c-. |
    h8 r r4 r |
    R1*3/4*3 |
    d,2.~\pp |
    d2. |
    r8 \repeat unfold 5 a' |
    \mBreak
    
    % p2 11
    r8 \repeat unfold 5 a |
    \mark #36
    R1*3/4*5 |
    \solo
    d,8-. h'4(-> a16 g fis a g e) |
    d8 r r4 r |
    d8-. h'4( a16 g fis a g e) |
    \mBreak
    
    % p2 12
    \mark #37
    d4 r r |
    R1*3/4*7 |
    \mark #38
    R1*3/4 |
    \tutti
    c'2.\ff
    h2.~ |
    h2. |
    g8-. h-. g-. h-. g-. h-. |
    g4 g g |
    g4 r r 
    \bar "|."
  }
}

clarinet_II = {
  \set Score.markFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \compressFullBarRests
  \defaultTimeSignature
  \time 4/4
  \tempo "Adagio"
  \tutti
  \key c \major
  \clef violin
  \relative c' {
    % p1 1
    g'1~ |
    g2 r \fermata |
    d1\pp\<~ |
    d2\> r\! \fermata
    \mark #1
    \solo
    \time 6/8
    R1*5/8*6 |
    r4. f,4.~\p |
    f2.( |
    b2. |
    es4. f, |
    \mBreak
    
    % p1 2
    b4.) r |
    R1*6/8*7 |
    r8 a'(\pp a a a a |
    g8) r8 r r4. |
    r8 a( a a a a |
    g8) r8 r r4. |
    R1*6/8 |
    R1*6/8  \fermataMarkup |
    \bar "||"
    \mBreak
    
    %p1 3
    \mark #2
    \time 2/4
    \key g \major
    \tempo "Andante con moto"
    \repeat volta 2 {
      R1*2/4*8
    }
    \mark #3
    \repeat volta 2 {
      R1*2/4*8
    }
    \mark #4
    \tutti
    d'2(\f |
    c2~ |
    c2 |
    h2) |
    h8\< c d dis\! |
    e8 c d e |
    d8-.\> cis-. c-. a-.\! |
    h4. r8 |
    \mBreak
    
    %p1 4
    \mark #5
    \solo
    \repeat volta 2 {
      R1*2/4*8
    }
    \mark #6
    \repeat volta 2 {
      R1*2/4*8
    }
    \mark #7
    \tutti
    R1*2/4
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        R1*2/4*3 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Cl.I"
        \stemUp {
          r4 r8 c |
          h8( c d e |
          h4 a8) r |
        }
      }
    >>
    R1*2/4*4 |
    \mark #8
    \repeat volta 2 {
      d8\f r r4 |
      R1*2/4 |
      fis8\f r r fis |
      \mBreak
      
      % p1 5
      d8 r r4 |
      d8\f r r4 |
      R1*2/4 |
      fis8\f r r fis |
      d8 r r4 |
    }
    
    \repeat volta 2 {
      \mark #9
      R1*2/4*4 |
      h8\f r r4 |
      R1*2/4 |
      \mBreak
      
      % p1 6
      fis'8 r r fis |
      h,8 r r4 |
    }
    \mark #10
    \tutti
    dis4->(\ff e8) r |
    R1*2/4 |
    c8\p c c c |
    h2 |
    dis4->(\ff e8)\! r |
    R1*2/4 |
    c8\pp c c c |
    \mBreak
    
    % p1 7
    \repeat volta 2 {
      \mark #11
      \solo
      h4 r |
      R1*2/4*7 |
    }
    \mark #12
    \repeat volta 2 {
      R1*2/4*8 |
    }
    \mark #13
    \tutti
    R1*2/4*7
    \mark #14
    \solo
    \repeat volta 2 {
      <<
        {
          \solo
          \override MultiMeasureRest.staff-position = #-4
          R1*2/4 |
          r8. gis16-.\p\< a-. gis-. a8~\! |
          \revert MultiMeasureRest.staff-position
        }
        \new CueVoice {
          \set instrumentCueName = "Viol.I"
          \stemUp {
            h16 h[ h h] h h h h|
            r32 e[ a h] c16
          }
        }
      >>
      a,8 r r4 |
      \mBreak
      
      % p1 8
      r16 h-.\< d-. g-. h-.\> g-. a-. d,-.\! |
      d8 r r4 |
      r8. gis,16-.\< a-. gis-. a8~\! |
      a8 r r4 |
      r16 d-.\p h-. d-. h8 r |
    }
    \mark #15
    \repeat volta 2 {
      d8\f r e r |
      \mBreak
      
      % p1 9
      d8 r r4 |
      R1*2/4 |
      d32\ff( e fis g a h c h a g fis e d c h a) |
      g8 r r4 |
      r8. gis16-.\p\< a-. gis-. a8~\! |
      a8 r r4 |
      \mBreak

      % p1 10
      r16 h-.\< d-. g-. h-.\> g-. a-. d,-.\! |
      d8 r r4 |
      r8. gis,16-.\< a-. gis-. a8~\! |
      a8 r r4 |
      r16 d-. h-. d-. h8 r |
    }
    \mark #16
    \tutti
    e4\ff fis |
    e2 |
    f4 d |
    \mBreak
    
    % p1 11
    es 2|
    r16 fis,( g a b a b g) |
    fis8 a4.~ |
    a2~ |
    \mark #17
    \bar "||"
    \time 4/4
    a4 r\fermata ^\markup { "Recit." } \solo r2 |
    R1*8 |
    \mark #18
    R1*16 |
    \mark #19
    R1\fermataMarkup\cadenza
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R1 |
        R1\fermataMarkup |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Timp."
        \clef bass
        \stemDown {
          d,,1 |
          d4 r r2\fermata |
        }
      }
    >>
    \clef violin
    \bar "||"
    \mBreak

    % p2 1
    \mark #20
    \solo
    \time 3/4
    \tempo "Polacca"
    R1*3/4*8 |
    \mark #21
    \tutti
    d''8\ff \repeat unfold 5 { d8 } |
    r8 \repeat unfold 5 { e8 } |
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 d8 d4-> |
    d8 \repeat unfold 5 { d8 } |
    r8 \repeat unfold 5 { e8 } |
    \mBreak
    
    % p2 2
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 d8 d4-> |
    \mark #22
    \solo
    R1*3/4*8 |
    \mark #23
    \tutti
    r8 d\ff d d cis cis |
    r8 \repeat unfold 5 { d } |
    r8 \repeat unfold 3 d cis cis |
    d8 d4-> \repeat unfold 3 d8 |
    d8 d4-> \repeat unfold 3 d8 |
    \mBreak
    
    % p2 3
    r8 \repeat unfold 5 d |
    r8 \repeat unfold 5 e |
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 d8 d4-> |
    \mark #24
    \solo
    R1*3/4*2 |
    fis2.(\p |
    \mBreak
    
    % p2 4
    d8) r8 r4 r |
    R1*3/4*4 |
    \mark #25
    R1*3/4*4 |
    \tutti
    dis2.\f |
    e2.~ |
    e4 r r |
    R1*3/4
    \mark #26
    \solo
    R1*3/4*3 |
    r8 a,8-.(\pp \repeat unfold 3 a-. a-.) |
    R1*3/4*4 |
    \mark #27
    R1*3/4*8 |
    \mark #28
    R1*3/4*3 |
    \mBreak
    
    % p2 5
    \tutti
    r8 \grace { fis'32 es d } es8\ff r es\turn r es\turn |
    r8 d8 r d g,4-> |
    R1*3/4*2 |
    r8 \grace { fis'32 es d } es8\ff r es\turn r es\turn |
    r8 d8 r d g,4-> |
    R1*3/4*2 |
    \mBreak
    
    % p2 6
    \mark #29
    b2.\ff |
    f'2. |
    es2. |
    \repeat unfold 4 d8 d4-> |
    R1*3/4*3 |
    R1*3/4 |
    \mark #30
    es,8 g'4-> f16( g as g f es) |
    es8 es4( d16 es f es d c) |
    \mBreak
    
    % p2 7
    b8 g'4 es16 g g f es d |
    \repeat unfold 4 d8 es r |
    b4\ff es2~ |
    es4 g2 |
    g4. es8 es4 |
    des2.~\> |
    des2.~ |
    \mBreak

    % p2 8
    des4\! r r |
    R1*3/4*3 |
    \mark #31
    \solo
    R1*3/4*8 |
    \mark #32
    \tutti
    d8\ff \repeat unfold 5 d8 |
    r8 \repeat unfold 5 e |
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 d8 d4-> |
    \repeat unfold 6 d8 |
    \mBreak
    
    % p2 9
    r8 \repeat unfold 5 e |
    \repeat unfold 3 { a16( fis) d8-.-> } |
    \repeat unfold 4 d8 d4-> |
    \mark #33
    \solo
    R1*3/4*8 |
    \mark #34
    R1*3/4*11 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        R1*3/4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice {
        \set instrumentCueName = "Cor. primo"
        \stemUp {
          c4. g'16 e c g e c |
        }
      }
    >>
    \mBreak
    
    % p2 10
    \mark #35
    r8 d-.\p\< g-. h-. d-. d-.\! |
    h'4-.\f r a-. |
    g8 r r4 r |
    R1*3/4*3 |
    h,2.~\pp |
    h2. |
    r8 \repeat unfold 5 c |
    r8 \repeat unfold 5 c |
    \mBreak
    
    % p2 11
    \mark #36
    R1*3/4*8 |
    \mark #37
    R1*3/4*8 |
    \mark #38
    R1*3/4*1 |
    \tutti
    fis2.\ff
    d2.~ |
    d2. |
    h8-. d-. h-. d-. h-. d-. |
    h4 h h |
    h4 r r |
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
      \set Score.markFormatter = #format-mark-box-numbers
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
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-numbers
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
    instrument = "Klarinette II in A"
  }
  \score {
    \new Staff {
      \compressFullBarRests
      \set Score.markFormatter = #format-mark-box-numbers
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        \transpose b b \clarinet_II
      }
    }
  }
}
