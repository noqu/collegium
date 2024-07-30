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
  title = "6. Samuel Goldenberg und Schmuyle"
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
  markup-system-spacing.basic-distance = #5
  markup-system-spacing.minimum-distance = #5
  markup-system-spacing.padding = #5
  % Distance between music systems
  system-system-spacing.basic-distance = #14
  system-system-spacing.minimum-distance = #14
  % system-system-spacing.padding = #10
  
  % Always print page numbers, starting with 6, on each part
  first-page-number = #6
  print-first-page-number = ##t
  bookpart-level-page-numbering = ##t
}

\layout {
  \context {
    \Staff
    % This allows the use of \startMeasureCount and \stopMeasureCount
    % See https://lilypond.org/doc/v2.23/Documentation/snippets/repeats#repeats-numbering-groups-of-measures
    \consists #Measure_counter_engraver
    % \RemoveEmptyStaves
    % \RemoveAllEmptyStaves
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
    % cl1 p6 1
    \mark #56
    \partial 32 cis,32(\f |
    gis'8) r16 r32 fisis64( gis) fisis?4->~ fisis8 r \tuplet 3/2 { his,16( cis dis } e?16.) cis32( |
    gis'8) r16 r32 \tuplet 3/2 { fisis64( gis fisis) } e?4->~ e8 r his16( cis dis e) |
    \mBreak
    
    % cl1 p6 2
    fis8.[\< gis16( a8-.) his-.]\! cis4\( h8\> a |
    \tuplet 3/2 { his8( a gis) } gis8..\)\! his32( gis8) r \mark #57 his,16-- cis-- dis-- e-- |
    fis8.[\< gis16( a8-.) his-.] cis4(\> his8 a)\! |
    \tuplet 3/2 { h8( a gis) } gis2~ gis8 r16 r32 cis,32( |
    \mBreak
    
    % cl1 p6 3
    \time 3/4
    gis'8) r16 r32 \tuplet 3/2 { fisis64( gis fisis) } e?8.. \tuplet 3/2 { dis64( e his) } e8..[ \appoggiatura { dis16 e } \tuplet 3/2 { dis64( cis his)] } |
    % cl1 p13 5
    \time 4/4
    e2.~ e8 r |
    \mark #58
    R1*2 |
    <e, e'>2~\mf <e e'>8 r r4 |
    r2 <e e'>2(\> |
    \mark #59
    e'8) r\! r4 r2 |
    \mBreak

    % cl1 p6 4
    R1 |
    <e, e'>2~\mf <e e'>8 r r4 |
    r2 <e e'>2(\> |
    c'8) r\! r4 r2 |
    \mark #60
    R1  |
    gis4~\f( gis8 fisis16 gis <e? e'?>2\sf |
    fisis8)\sf r8 r4 gis4(\f(~ gis8 \tuplet 3/2 { fisis16 gis fisis } |
    \mBreak
    
    % cl1 p6 5
    <e? e'?>2\sf fisis8)\sf r r4 |
    \mark #61
    fis8.[\< gis16( a8) his] cis4(\> h8 a) |
    his8( a16 gis)\! gis8 r r4 r4 |
    fis8.[ gis16(\cresc a8)\! his] cis4( his8 a) |
    \mBreak
    
    % cl1 p14 4
    h8(\< a16 gis) gis'8\ff \mark #62 r8 r2\fermata |
    gis,4(\p\< a gis~\> gis8) r\! |
    gis4(\<\p a gis~\> gis8) r\! |
    r8 r16 \tuplet 3/2 { fisis'32(\f gis fisis) } e?4\sf~ e8 r r \tuplet 3/2 { dis''16(\ff e dis) } |
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
    % cl2 p5 1
    \mark #56
    \partial 32 cis,32(\f |
    gis'8) r16 r32 fisis64( gis) fisis?4->~ fisis8 r \tuplet 3/2 { his,16( cis dis } e?16.) cis32( |
    gis'8) r16 r32 \tuplet 3/2 { fisis64( gis fisis) } e?4->~ e8 r his16( cis dis e) |
    \mBreak
    
    % cl2 p5 2
    fis8.[\< gis16( a8-.) his-.]\! cis4\( h8\> a |
    \tuplet 3/2 { his8( a gis) } gis8..\)\! his32( gis8) r \mark #57 his,16-- cis-- dis-- e-- |
    fis8.[\< gis16( a8-.) his-.] cis4(\> his8 a)\! |
    \tuplet 3/2 { h8( a gis) } gis2~ gis8 r16 r32 cis,32( |
    \mBreak
    
    % cl2 p5 3
    \time 3/4
    gis'8) r16 r32 \tuplet 3/2 { fisis64( gis fisis) } e?8.. \tuplet 3/2 { dis64( e his) } e8..[ \appoggiatura { dis16 e } \tuplet 3/2 { dis64( cis his)] } |
    % cl1 p13 5
    \time 4/4
    e2.~ e8 r |
    \mark #58
    R1*2 |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R1*3 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \relative {
        \stemDown
        \voiceTwo
        e2~\mf^"Cl.I" e8 r r4 |
        r2 e2(\> |
        \mark #59
        e'8) r\! r4 r2 |
        \stemNeutral
      }
    >>
    \mBreak

    % cl2 p6 1
    R1 |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R1*3 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \relative {
        \stemDown
        \voiceTwo
        e2~\mf^"Cl.I" e8 r r4 |
        r2 e2(\> |
        c'8) r\! r4 r2 |
        \stemNeutral
      }
    >>
    \mark #60
    R1  |
    gis,4~\f( gis8 fisis16 gis <e? e'?>2\sf |
    fisis8)\sf r8 r4 gis4(\f(~ gis8 \tuplet 3/2 { fisis16 gis fisis } |
    \mBreak
    
    % cl2 p6 2
    <e e'>2\sf fisis8)\sf r r4 |
    \mark #61
    fis8.[\< gis16( a8) his] cis4(\> h8 a) |
    his8( a16 gis)\! gis8 r r4 r4 |
    fis8.[ gis16(\cresc a8)\! his] cis4( his8 a) |
    \mBreak
    
    % cl2 p6 3
    h8(\< a16 gis) e'8\ff \mark #62 r8 r2\fermata |
    <<
      {
        \override MultiMeasureRest.staff-position = #2
        R1*3 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \relative {
        \stemDown
        \voiceTwo
        gis4(\p\<^"Cl.I" a gis~\> gis8) r\! |
        gis4(\<\p a gis~\> gis8) r\! |
        \stemNeutral
      }
    >>
    r8 r16 \tuplet 3/2 { fisis,32(\f gis fisis) } <e? e'?>4\sf~ e8 r r \tuplet 3/2 { dis'''16(\ff e dis) } |
    cis8 r r4 r2\fermata |
    \bar "|."
    \mBreak
  }
}

% ---------------------------------------------------------

%{
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
%}


\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \transpose ais a \clarinet_I
    }
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \transpose ais a \clarinet_II
    }
  }
}
