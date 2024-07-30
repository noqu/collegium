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
  title = "8. Catacombae (Sepulchrum romanum)"
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
  first-page-number = #8
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

catacombe_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 3/4
  \tempo "Largo"
  \key f \major
  \clef violin
  \relative c'' {
    % cl1 p7 1
    \mark #72
    \repeat unfold 3 { R2.\fermata | }
    R2.*4 |
    R2.\fermata |
    R2.*2 |
    R2.\fermata |
    \mark #73
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        R2.*3 |
        \override MultiMeasureRest.staff-position = #2
        R2.*2 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a c \relative {
        \stemDown
        \clef bass
        h,?2.^"Bn.I"\fermata |
        b2.\fermata
        g''2~\fermata g8 r |
        a,2.~\p |
        a2. |
        \clef violin
        \stemNeutral
      }
    >>
    % \mBreak
    
    % cl1 p7 2
    <e,, e'>2.(\p\< |
    f2.) |
    a2.( |
    a2.) |
    f2.~\> |
    f4~ f8\! r r4 |
    \mark #74
    R2.*6 |
    <<
      {
        R2. |
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \stemDown
        \voiceTwo
        % Invisible grace note makes slur and decrescendo visible
        d'2.(^"Trp.I"\ff\fermata\> \grace s8)\! |
        \stemNeutral
      }
    >>
    \clef violin
    f2\!\fermata\pp r4
    \bar "|."
  }
}

catacombe_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 3/4
  \tempo "Largo"
  \key f \major
  \clef violin
  \relative c'' {
    % cl2 p7 1
    \mark #72
    \repeat unfold 3 { R2.\fermata | }
    R2.*4 |
    R2.\fermata |
    R2.*2 |
    R2.\fermata |
    \mark #73
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        R2.*3 |
        \override MultiMeasureRest.staff-position = #2
        R2.*2 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a c \relative {
        \stemDown
        \clef bass
        h,?2.\fermata^"Bn.I" |
        b2.\fermata
        g''2~\fermata g8 r |
        a,2.~\p |
        a2. |
        \clef violin
        \stemNeutral
      }
    >>
    % \mBreak
    
    % cl2 p7 2
    <e,, e'>2.(\p\< |
    f2.) |
    a2.( |
    a2.) |
    f2.~\> |
    f4~ f8\! r r4 |
    \mark #74
    R2.*6 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-4
        R2.*2 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \stemDown
        \clef bass
        fis2.^"Cbn"\ff\fermata\>
        \clef violin
        d2\!\fermata\pp^"Clar.I" r4
        \stemNeutral
      }
    >>
    \bar "|."
  }
}

cum_mortuis_clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/4
  \tempo "Andante non troppo con lamento"
  \key f \major
  \clef violin
  \relative c'' {
    % cl1 p8 1
    \mark #75
    R1.*3 |
    <<
      {
        R1.*2 |
      }
      \new CueVoice \relative {
        \stemDown
        \voiceTwo
        r2_"Clar.basso" r4 r4 e\p( a |
        f4 e a f4~ f8) r r4 |
        \stemNeutral
      }
    >>
    <<
      {
        R1.*1 |
        r4 cis,(\p d e-.) r r |
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \stemDown
        \voiceTwo
        \mark #76
        r2 r4 r\fermata fis'(^"Hb.I" g |
        e) s2 s2. |
        \stemNeutral
      }
    >>
    \mBreak
    e2( f'8) r r2 r4 |
    
    % cl1 p8 2
    R1.*3 |
    \mark #77
    es1.--( |
    e4) r r r2 r4 |
    es1.--( |
    e4) r r r2 r4 |
    \mBreak
    \mark #78
    ges2.(\pEspress c,2 des4 |
    e4) r r r2 r4 |
    R1.*2
    % Originally already in Bb for the change in 79
    ges1.~\pp |
    ges8 r r4 r r2\fermata r4 |
    \bar "|."
  }
}

cum_mortuis_clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/4
  \tempo "Andante non troppo con lamento"
  \key f \major
  \clef violin
  \relative c'' {
    % cl2 p8 1
    \mark #75
    R1.*3 |
    <<
      {
        R1.*2 |
      }
      \new CueVoice \relative {
        \stemDown
        \voiceTwo
        r2 r4^"Clar.basso" r4 e\p( a |
        f4 e a f4~ f8) r r4 |
        \stemNeutral
      }
    >>
    <<
      {
        R1.*1 |
        r4 a,(\p b c-.) r r |
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \stemDown
        \voiceTwo
        \mark #76
        r2 r4 r\fermata fis'(^"Hb.I" g |
        e) s2 s2. |
        \voiceOne
        \stemNeutral
      }
    >>
    \mBreak
    r4 a( c'8) r r2 r4 |
    
    R1.*3 |
    % cl1 p8 2
    \mark #77
    f,,1.--( |
    a4) r r r2 r4 |
    f1.--( |
    a4) r r r2 r4 |
    \mBreak
    
    \mark #78
    R1.*4
    % Originally already in Bb for the change in 79
    d'1.~\pp |
    d8 r r4 r r2\fermata r4
    \bar "|."
  }
}

% ---------------------------------------------------------


\bookpart {
  \header{
    instrument = "Klarinette I in Bb"
  }
  \score {
    \new Staff {
      \transpose b a \catacombe_clarinet_I
    }
  }

  \markup \fill-line { \fontsize #4 " " }
  \markup \fill-line { \fontsize #4 \bold \center-column { "Cum mortuis in lingua mortua" } }

  \score {
    \new Staff {
      \transpose b a \cum_mortuis_clarinet_I
    }
  }
}

\bookpart {
  \header{
    instrument = "Klarinette II in Bb"
  }
  \score {
    \new Staff {
      \transpose b a \catacombe_clarinet_II
    }
  }

  \markup \fill-line { \fontsize #4 " " }
  \markup \fill-line { \fontsize #4 \bold \center-column { "Cum mortuis in lingua mortua" } }

  \score {
    \new Staff {
      \transpose b a \cum_mortuis_clarinet_II
    }
  }
}
