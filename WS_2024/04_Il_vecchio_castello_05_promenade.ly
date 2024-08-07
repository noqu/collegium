\version "2.24.1"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
}

\header {
  title = "2. Il vecchio castello"
  subtitle = "(Das alte Schloss)"
  composerShort = "Modest Mussorgsky"
  composer = "Modest Mussorgsky (1839 - 1881)"
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
  
  % Always print page numbers, starting with 3, on each part
  first-page-number = #3
  print-first-page-number = ##t
  bookpart-level-page-numbering = ##t
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

il_veccio_castello_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Andante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl1 p3 1
    \mark #19
    R2.*6_"Bn." |
    \mark #20
    R2.*7 |
    \mark #21
    R2.*6 |
    \mark #22
    R2.*10_"Sax. alto" |
    \mark #23
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*6 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \stemUp
        \voiceOne
        e''4\p^"Vl.I" e8 fis8.( e16) dis8 |
        e4 e8 fis8.( e16) dis8 |
        e4.-- d--\<( |
        a'4.--~\! a8 gis-- fis) |
        \mBreak

        % cl1 p3 2
        e4.--\> gis-- |
        fis4.-- e--\! |
        \stemNeutral
      }
    >>
    des2.(\p |
    b2.) |
    h4.--( d,4) r8 |
    \mark #24
    \repeat unfold 4 e'4.-- |
    e4.(\< c\! |
    c'4. h8 c a |
    g4.)\> h4.( |
    \mBreak
    
    % cl1 p3 3
    a8 h fis g fis g)\! |
    des2.( |
    b2.) |
    \mark #25 h4.( fis4) r8 |
    R2.*4 |
    fis,2.~( |
    fis4. g |
    fis4. h~ |
    h4.) r4 r8 |
    \mark #26 |
    R2.*2 |
    es'4.~(\mf\<  es8 d es) |
    \mBreak
    
    % cl1 p3 4
    e4( h'8) e,4\! r8 |
    des2.~(\f\> |
    des2. |
    \mark #27 h8)\pp r r r4 r8 |
    R2.*2 
    r4 r8 h'4.(\mf\> |
    a4. g |
    fis8)\! r r r4 r8 |
    R2.*2 |
    \mark #28
    r4 r8 r4 fis,8(\espress |
    h2.~ |
    \mBreak
    
    % cl1 p3 5
    h8 d cis? \appoggiatura {h16 cis16} h8 g h) |
    h8.( g'16) h,8 h4.~ |
    h4. r4 r8 |
    c4.~(\< c8 h c) |
    des8.( as'16) des,8 des4 r8 |
    es4.~( es8 d es) |
    e8.( h'16) e,8\! e4 r8 |
    \mBreak
    
    % cl1 p3 6
    \mark #29
    des2.~\f\> |
    des2. |
    fis4.\pp f8( e f) |
    fis4. f8( e f) |
    fis4.( f) |
    e4.(\< h'\> |
    a4. g8 h g) |
    des2.(\p |
    b2.) |
    \mBreak
    
    % cl1 p3 7
    R2. |
    \mark #30
    R2.*7 |
    \mark #31
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*2 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in Es)
      \new CueVoice \transpose a dis \relative {
        \stemUp
        r4^"Sax. alto" r8 r4 c''8(\pp\espress |
        f2.) |
        \stemNeutral
      }
    >>
    fis,4.(\pp\< g |
    d'4.~\> d4 c8 |
    h8 ais) \! r r4 r8 |
    R2.* 2 |
    \mark #32
    R2.*5 |
    R2.\fermata |
  }
}

il_veccio_castello_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Andante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl2 p3 1
    \mark #19
    R2.*6_"Bn." |
    \mark #20
    R2.*7 |
    \mark #21
    R2.*6 |
    \mark #22
    R2.*10_"Sax. alto" |
    \mark #23
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*6 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \stemUp
        \voiceOne
        e''4\p^"Vl.I" e8 fis8.( e16) dis8 |
        e4 e8 fis8.( e16) dis8 |
        e4.-- d--\<( |
        a'4.--~\! a8 gis-- fis) |
        \mBreak

        % cl2 p3 2
        e4.--\> gis-- |
        fis4.-- e--\! |
        \stemNeutral
      }
    >>
    b2.(\p |
    fis2.) |
    fis4.--( h,4) r8 |
    \mark #24
    \repeat unfold 4 c'4.-- |
    c4.(\< a\! |
    c4. h8 c a |
    g4.)\> h4.( |
    \mBreak
    
    % cl2 p3 3
    a8 h fis g fis g)\! |
    b2.( |
    fis2.) |
    \mark #25 fis4.( d4) r8 |
    R2.*4 |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2.*6 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \relative {
        \voiceTwo
        \stemDown
        fis2.~(\p^"Cl.I" |
        fis4. g |
        fis4. h~ |
        h4.) r |
        \stemNeutral
      }
    >>
    \mark #26
    R2.*2
    \mBreak
    
    % cl2 p3 4
    es'4.~(\mf\< es8 d es) |
    e4( h'8) e,4\! r8 |
    fis,2.~(\f\> |
    fis2. |
    \mark #27 h8)\pp r r r4 r8 |
    R2.*2 
    r4 r8 h4.(\mf\> |
    a4. g |
    fis8)\! r r r4 r8 |
    \mBreak
    
    % cl2 p3 5
    R2.*2 |
    \mark #28
    R2. |
    fis,2.~(\p |
    fis4. g |
    d'2.~ |
    d4.) r4 r8 |
    R2.*4
    \mark #29
    fis2.~\f\> |
    fis2. |
    fis4.\pp f8( e f) |
    fis4. f8( e f) |
    \mBreak
    
    % cl2 p3 6
    ges4.( f) |
    e4.\(\< h'\> |
    a4. g8( h g)\) |
    b2.(\p |
    fis2.) |
    R2. |
    \mark #30
    R2.*7 |
    \mark #31
    R2.*7
    \mark #32
    R2.*5
    R2.\fermata
    \bar "|."
  }
}

il_veccio_castello_saxophone_alto = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Andante"
  \key as \major
  \clef violin
  \relative c'' {
    % sax p1 1
    \mark #19
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R2.*6 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition fits for alto saxophone (written in Es)
      \new CueVoice \transpose c c \relative {
        \stemDown
        \voiceOne
        \clef bass
        r4. c4.->~^"Fag. Solo" |
        c4 \repeat unfold 4 { c8-.-- } |
        c8.( des16) c8  es-.( des-. c-.) |
        b8.( c16) b8  des-.( c-. b-.) |
        as4( b8 c b as) |
        \mBreak
        
        % sax p2 1
        g8.( as16) g8 b-.( as-. g-.) |
        \clef violin
        \stemNeutral
      }
    >>
    \mark #20
    r4^"Sax."^"molto cantabile con dolore" r8 r4\solo c8(\p_"vibrato" |
    f2.~)( |
    % Score says this is has a slur, not just a grace, dito for following
    f8 as g? \appoggiatura { f16 g } f8 des f |
    \mBreak
    
    % sax p2 2
    f4-.) c8( es4.~ |
    es8 des c \appoggiatura c des c b |
    c8-> f,4~ f4.~ |
    f8 g as \appoggiatura { b16 c } b8 as g |
    \mark #21
    as4. f~ |
    \mBreak
    
    % sax p2 3
    f4) r8 r4 r8 |
    R2.*3 |
    r4 r8 r4 c'8(\p |
    \mark #22
    f2.~ |
    f8 as g? \appoggiatura { f16 g } f8 des f |
    f4-.) c8( des4.~ |
    \mBreak
    
    % sax p2 4
    des8\< es f ges as b\! |
    es,4.~ es8\> f ges |
    f4) c8( f4 es8\! |
    des4. c8 b as) |
    g?8.( as16) g8 b8( as) g |
    \mBreak
    
    % sax p2 5
    as4.( f4.~ |
    f4) r8 r4 r8 |
    \mark #23
    R2.*6 |
    c'4.(\p b4 as8) |
    g?8.( as16) g8 b8( as) g |
    \mBreak
    
    % sax p2 6
    as4.--( f4) r8 |
    \mark #24
    R2.*6 |
    c'4.(\espress b4 as8) |
    g?8.( as16) g8 b8( as) g |
    \mark #25
    as4.( f4) r8 |
    R2.*8 |
    \mBreak
    
    % sax p2 7
    \mark #26
    R2.*6 |
    \mark #27
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*4 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to Sax (written in C)
      \new CueVoice \transpose dis, c \relative {
        \stemUp
        \voiceOne
        c''4.--\pp^"Hb.I" h8( b h) |
        c4.-- h8( b h) |
        c4.( h |
        b4.) f'( |
        es4. des) |
        \stemNeutral
      }
    >>
    c'4.(\espress b4 as8) |
    \mBreak
    
    % sax p2 8
    g?8.( as16) g8 b8( as) g |
    as4.--( f4) r8 |
    \mark #28
    R2.*9 |
    \mark #29
    R2.*5 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*2 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to Sax (written in C)
      \new CueVoice \transpose dis, c \relative {
        \stemUp
        \voiceOne
        r4.^"Fl.I" gis''4.( |
        fis4. e8 gis e) |
        \stemNeutral
      }
    >>
    \mBreak
    
    % sax p2 9
    c'4.(\espress b8 c as) |
    g?8.( as16) g8 b8( as g) |
    R2. |
    \mark #30
    R2.*6 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-12
        R2. |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to Sax (written in C)
      \new CueVoice \transpose dis, c \relative {
        \voiceTwo
        \stemUp
        <<
        { ais8.(^"Viol.I" h16) ais8 cis8( h) ais | }
        { ais'8.( h16) ais8 cis8( h) ais | }
        >>
        \stemNeutral
      }
    >>
    \mark #31
    r4 r8 r4^"Sax" c8(\pp\espress |
    \mBreak
    
    % sax p2 10
    f2.~)( |
    f8\< as g? \appoggiatura { f16 g } f8 des f |
    f4-.)\! c8( es4.~ |
    es8\> des c \appoggiatura c des c b |
    c8->\! f,4~ f4) r8 |
    R2. |
    \mBreak
    
    % sax p2 11
    \mark #32
    des'4--\p\> r8 c4-- r8\! |
    R2. |
    ces4-- r8 b4-- r8 |
    r4 r8 r4 c8(\f |
    f2.~\> |
    f4.~ f4)\fermata\! r8 |
    \bar "|."
  }
}

promenade_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 5/4
  \tempo "Moderato non tanto pesante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl1 p3 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*5/4 |
        \time 6/4
        R1*6/4 |
        \time 5/4
        \override MultiMeasureRest.staff-position = #2
        R1*5/4 |
        \time 6/4
        fis2\rest
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose a, c \relative {
        \stemDown
        gis'4\f^"Trp.I" fis h cis8 fis dis4 |
        \time 6/4
        cis8 fis dis4 h cis gis fis |
        \time 5/4
        \clef bass gis,,4\f^"Tbn.III" fis \clef violin fis''\f^"Cl.II" cis fis |
        \mBreak
        
        % cl1 p3 2
        \time 6/4
        ais4 h
        \stemNeutral
      }
    >>
    
    fis4 e h des |
    \mark #33
    \time 5/4
    a'4 h e, a8 h e,4 |
    \time 6/4
    h'8 des a4 a' fis e8 d a4 |
    \time 5/4
    R1*5/4\rit
    \time 4/4
    R1
    % Magic taken from https://lsr.di.unimi.it/LSR/Item?id=10
    % for a fermata hovering over the last bar line
    \context Staff  {
      \bar "|."
      \override Score.TextMark.self-alignment-X = #CENTER
      \textEndMark \markup { \musicglyph "scripts.ufermata" }
    }
  }
}

promenade_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 5/4
  \tempo "Moderato non tanto pesante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl1 p3 1
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R1*5/4 |
        \time 6/4
        R1*6/4 |
        \time 5/4
        f,,2\rest
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose a, c \relative {
        \stemDown
        gis'4\f^"Trp.I" fis h cis8 fis dis4 |
        \time 6/4
        cis8 fis dis4 h cis gis fis |
        \time 5/4
        \clef bass gis,,4\f^"Tbn.III" fis 
        \stemNeutral
      }
    >>
    \clef violin
    a'4\f e a |
    \time 6/4
    \mBreak
    
    % cl1 p3 2
    cis?4 d d h r r |
    \mark #33
    \time 5/4
    a'4 h e, a8 h e,4 |
    \time 6/4
    h'8 cis? a4 a' fis e8 d a4 |
    \time 5/4
    R1*5/4\rit
    \time 4/4
    R1 |
    % Magic taken from https://lsr.di.unimi.it/LSR/Item?id=10
    % for a fermata hovering over the last bar line
    \context Staff  {
      \bar "|."
      \override Score.TextMark.self-alignment-X = #CENTER
      \textEndMark \markup { \musicglyph "scripts.ufermata" }
    }
  }
}
% ---------------------------------------------------------

%{
\bookpart {
  \header{
    instrument = "Klarinette I und II in Bb"
  }
  \score {
    \new GrandStaff \with {
        \RemoveAllEmptyStaves
    }
    <<
      \new Staff  {
        \transpose b a \clarinet_I
      }
      \new Staff \with {
        \RemoveAllEmptyStaves
      } {
        \transpose b a \clarinet_II
      }
    >>
  }
}
%}

\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \transpose b a \il_veccio_castello_clarinet_I
    }
  }

  \markup \fill-line { \fontsize #4 " " }
  \markup \fill-line { \fontsize #4 \bold \center-column { "Promenade" } }

  \score {
    \new Staff {
      \transpose b a \promenade_clarinet_I
    }
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \transpose b a \il_veccio_castello_clarinet_II
    }
  }

  \markup \fill-line { \fontsize #4 " " }
  \markup \fill-line { \fontsize #4 \bold \center-column { "Promenade" } }

  \score {
    \new Staff {
      \transpose b a \promenade_clarinet_II
    }
  }
}

\bookpart {
  \paper {
    print-first-page-number = ##f 
  }
  \header{
    instrument = "Altsaxophon in Bb"
  }
  \score {
    \new Staff {
      \transpose b dis \il_veccio_castello_saxophone_alto
    }
  }
}
