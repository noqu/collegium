\version "2.24.1"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##f
}

\header{
  title = "VI Samuel Goldenberg und Schmuyle"
  subtitle = ""
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
pocoDim = _\markup { \italic "poco dim." }
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
  % system-system-spacing.basic-distance = #6
  % system-system-spacing.minimum-distance = #6
  % system-system-spacing.padding = #10
  
}

\layout {
  \context {
    \Staff
    % This allows the use of \startMeasureCount and \stopMeasureCount
    % See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
    \consists #Measure_counter_engraver
    % \RemoveEmptyStaves
    \RemoveAllEmptyStaves
  }
}

% ---------------------------------------------------------

clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Andante"
  \key e \major
  \clef violin
  \relative c'' {
    % cl1 p13 1
    \mark #56
    \partial 32 cis,32(\f^"a 2" |
    gis'8) r16 r32 fisis64( gis) fisis!4->~ fisis8 r \tuplet 3/2 { his,16( cis dis } e16.) cis32( |
    \mBreak
    
    % cl1 p13 2
    gis'8)^"a 2" r16 r32 \tuplet 3/2 { fisis64( gis fisis) } e4->~ e8 r his16( cis dis e) |
    fis8.[\< gis16( a8-.) his-.]\! cis4\( h8\> a |
    \mBreak
    
    % cl1 p13 3
    \tuplet 3/2 { his8(^"a 2" a gis) } gis8..\)\! his32( gis8) r \mark #57 his,16-- cis-- dis-- e-- |
    fis8.[\< gis16( a8) his] cis4(\> his8 a)\! |
    \mBreak
    
    % cl1 p13 4
    \tuplet 3/2 { h8(^"a 2" a gis) } gis2~ gis8 r16 r32 cis,32( |
    \time 3/4
    gis'8) r16 r32 \tuplet 3/2 { fisis64( gis fisis) } e8.. \tuplet 3/2 { dis64( e his) } e8..[ \appoggiatura { dis16 e } \tuplet 3/2 { dis64( cis his)] } |
    \mBreak
    
    % cl1 p13 5
    \time 4/4
    e2.~ e8 r |
    \mark #58
    R1*2 |
    e,2~\mf e8 r r4 |
    r2 e2(\> |
    \mark #59
    e'8) r\! r4 r2 |
    R1 |
    \mBreak

    % cl1 p14 1
    e,2~\mf^"Clar.I" e8 r r4 |
    r2 e2(\> |
    c'8) r\! r4 r2 |
    \mark #60
    r2 r4 r8. cis16\f( |
    gis4~ gis8 fisis16 gis e2\sf |
    \mBreak
    
    % cl1 p14 2
    g8)\sf^"Clar.I" r8 r8 r16 cis16(\f gis4)\(~ gis8 \tuplet 3/2 { fisis16( gis fisis) } |
    e2\sf g8\)\sf r r4 |
    \mark #61
    fis8.[\< gis16( a8) his] cis4(\> h8 a) |
    \mBreak
    
    % cl1 p14 3
    his8( a16 gis)\! gis8 r r4 r4 |
    fis8.[ gis16(\cresc a8)\! his] cis4( his8 a) |
    h8(\< a16 gis) gis'8\ff \mark #62 r8 r2\fermata |
    \mBreak
    
    % cl1 p14 4
    gis,4(\p\< a gis~\> gis8) r\! |
    gis4(\< a gis~\> gis8) r\! |
    r8 r16 \tuplet 3/2 { fisis'32(\f gis fisis) } e4\sf~ e8 r r \tuplet 3/2 { dis''16(\ff e dis) } |
    cis8 r r4 r2\fermata |
    \bar "|."
    \mBreak
  }
}

clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Andante"
  \key e \major
  \clef violin
  \relative c'' {
    % cl2 p13 1
    \partial32 r32 |
    R1*6 |
    \time 3/4
    R2. |
    \mBreak
    
    % cl2 p13 5
    \time 4/4
    e,2.~ e8 r |
    \mark #58
    R1*6 |
    \mBreak
    
    % cl2 p14 1
    R1*5 |
    \mBreak

    % cl2 p14 2
    R1*3 |
    \mBreak
    
    % cl2 p14 3
    R1*2 |
    r4 e8 r r2\fermata
    \mBreak
    
    % cl2 p14 4
    R1*2 |
    r8 r16 \tuplet 3/2 { fisis,32(\f gis fisis) } e4\sf~ e8 r r \tuplet 3/2 { dis'''16(\ff e dis) } |
    cis8 r r4 r2\fermata |
    \bar "|."
    \mBreak
  }
}

clarinet_bass = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 4/4
  \tempo "Andante"
  \key e \major
  \clef violin
  \relative c'' {
    % clb p5 1
    \mark #56
    \partial 32 cis,32(\f |
    gis'8) r16 r32 fisis64( gis) fisis4->~ fisis8 r \tuplet 3/2 { his,16( cis dis } e16.) cis32( |
    gis'8) r16 r32 \tuplet 3/2 { fisis64( gis fisis) } e4->~ e8 r his16( cis dis e) |
    \mBreak
    
    % clb p5 2
    fis8.[\< gis16( a8) his]\! cis4\( h8\> a |
    \tuplet 3/2 { his8( a gis) } gis8..\)\! his32( gis8) r his,16-- cis-- dis-- e-- |
    \mark #57 
    fis8.[\< gis16( a8) his] cis4(\> his?8 a)\! |
    \mBreak
    
    % clb p5 3
    \tuplet 3/2 { h8( a gis) } gis2~ gis8 r16 r32 cis,32( |
    \time 3/4
    gis'8) r16 r32 \tuplet 3/2 { fisis64( gis fisis) } e8.. \tuplet 3/2 { dis64( e his) } e8..[ \appoggiatura { dis16 e } \tuplet 3/2 { dis64( cis his)] } |
    \time 4/4
    e2.~ e8 r |
    \mBreak
    
    % clb p5 4
    \mark #58
    e2~\mf e8 r r4 |
    r2 e2~ |
    e8 r r4 r2 |
    \mark #59
    e2~\mf e8 r r4 |
    r2 e2~\> |
    e8 r\! r4 r2 |
    \mBreak
    
    % clb p6 1
    R1*2
    \mark #60
    r2 r4 r8. cis16\f( |
    gis4~ gis8 fisis16 gis e2\sf |
    g8)\sf r8 r8 r16 cis16(\f gis4)\(~ gis8 \tuplet 3/2 { fisis16( gis fisis) } |
    \mBreak

    % clb p6 2
    e2\sf g8\)\sf r r4 |
    \mark #61
    fis8.[\< gis16( a8) his] cis4(\> h8 a) |
    his8( a16 gis)\! gis8 r r4 r8 cis |
    \mBreak
    
    % clb p6 3
    fis,8.[ gis16(\cresc a8)\! his] cis4( his8 a) |
    h8(\< a16 gis) gis'8\ff r8 r4\fermata \mark #62 gis,\p |
    \after 2 \> cis2.~\< cis8\< \acciaccatura fisis,8 gis-. |
    \mBreak
    
    % clb p6 4
    \after 2 \> cis2.~\< cis8\< \acciaccatura fisis,8 gis-.\sf |
    r8\! r16 \tuplet 3/2 { fisis'32(\f gis fisis) } e4\sf~ e8 r r \tuplet 3/2 { dis16(\ff e dis) } |
    cis8 r r4 r2\fermata |
    \bar "|."
    \mBreak
  }
}

% ---------------------------------------------------------

\bookpart {
  \header{
    instrument = "Klarinette I und II in A"
  }
  \score {
    \new GrandStaff <<
      \new Staff {
        \transpose ais a \clarinet_I
      }
      \new Staff {
        \transpose ais a \clarinet_II
      }
    >>
  }
}

\bookpart {
  \header{
    instrument = "Bassklarinette in A"
  }
  \score {
    \new Staff {
      \transpose ais a \clarinet_bass
    }
  }
}
