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
  title = "II Il vecchio castello"
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
  markup-system-spacing.basic-distance = #12
  markup-system-spacing.minimum-distance = #12
  markup-system-spacing.padding = #10
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
    \RemoveAllEmptyStaves
  }
}

% ---------------------------------------------------------

clarinet_I = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Andante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl1 p6 1
    \mark #19
    R2.*6 |
    \mark #20
    R2.*7 |
    % This hidden grace note is required so that \RemoveAllEmptyStaves doesn't remove the whole staff (rests only)
    \hideNotes
    \mark #21
    \grace c16
    \unHideNotes
    R2.*6 |
    \mBreak

    % cl1 p6 2
    \mark #22
    R2.*10 |
    \mark #23
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*6 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in C)
      \new CueVoice \transpose a, c \relative {
        \key h \major
        \stemUp
        e''4\p^"Vl.I" e8 fis8.( e16) dis8 |
        e4 e8 fis8.( e16) dis8 |
        e4.-- d--\<( |
        a'4.--~\! a8 gis-- fis) |
        e4.-- gis-- |
        \mBreak

        % cl1 p6 3
        fis4.-- e-- |
        \stemNeutral
      }
    >>
    \key d \major
    cis2.(\p |
    ais2.) |
    h4.--( d,4) r8 |
    \mark #24
    \repeat unfold 4 e'4.-- |
    e4.(\< c\! |
    \mBreak
    
    % cl1 p6 4
    c'4. h8 c a |
    g4.)\> h4.( |
    a8 h fis g fis g)\! |
    cis,2.( |
    ais2.) |
    \mark #25 h4.( fis4) r8 |
    R2.*4 |
    \mBreak
    
    % cl1 p6 5
    fis,2.~(^"a 2" |
    fis4. g |
    fis4. h~ |
    h4.) r4 r8 |
    \mark #26 |
    R2.*2 |
    dis'4.~(\mf\<  dis8 d dis) |
    e4( h'8) e,4\! r8 |
    \mBreak
    
    % cl1 p6 6
    cis2.~(\f\> |
    cis2. |
    \mark #27 h8)\pp r r r4 r8 |
    R2.*2 
    r4 r8 h'4.(\mf\> |
    a4. g |
    fis8)\! r r r4 r8 |
    \mBreak
    
    % cl1 p7 1
    R2.*2 |
    \mark #28
    r4 r8 r4 fis,8(\espress |
    h2.~ |
    h8 d cis \appoggiatura {h16 cis16} h8 g h) |
    h8.( g'16) h,8 h4.~ |
    h4. r4 r8 |
    \mBreak
    
    % cl1 p7 2
    c4.~(\< c8 h c) |
    cis8.( gis'16) cis,8 cis4 r8 |
    dis4.~( dis8 d dis) |
    e8.( h'16) e,8\! e4 r8 |
    \mark #29
    c2.~\f\> |
    \mBreak
    
    % cl1 p7 3
    c2. |
    fis4.\p eis8( e eis) |
    fis4. eis8( e eis) |
    fis4.( eis) |
    e4.(\< h'\> |
    \mBreak
    
    % cl1 p7 4
    a4. g8 h g) |
    cis,2.(\p |
    ais2.) |
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
        \key as \major
        \stemUp
        r4^"Sax Alto" r8 r4 c''8(\pp\espress |
        \mBreak
        f2.) |
        \stemNeutral
      }
    >>
    \key d \major
    fis,4.(\pp\<^"Clar.I" g |
    d'4.~d4\> c8 |
    h8 ais) \! r r4 r8 |
    R2.* 2 |
    \mark #32
    R2.*6 |
    % Magic taken from https://lsr.di.unimi.it/LSR/Item?id=10
    % for a fermata hovering over the last bar line
    \context Staff = "one" {
      \bar "|."
      \override Score.TextMark.self-alignment-X = #CENTER
      \textEndMark \markup { \musicglyph "scripts.ufermata" }
    }
  }
}

clarinet_II = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Andante"
  \key d \major
  \clef violin
  \relative c'' {
    % cl2 p6 1
    \mark #19
    R2.*6 |
    \mark #20
    R2.*7 |
    % We need to leave this mark out because the one in the 1st clarinet is shifted
    % by an invisible grace note, so we would see two marks
    % \mark #21
    R2.*6 |
    \mBreak

    % cl2 p6 2
    \mark #22
    R2.*10 |
    \mark #23
    R2.*6 |

    % cl2 p6 3
    ais2.(\p |
    fis2.) |
    fis4.--( h,4) r8 |
    \mark #24
    \repeat unfold 4 c'4.-- |
    c4.(\< a\! |
    \mBreak
    
    % cl2 p6 4
    c4. h8 c a |
    g4.)\> h4.( |
    a8 h fis g fis g)\! |
    ais2.( |
    fis2.) |
    \mark #25 fis4.( d4) r8 |
    R2.*4 |
    \mBreak
    
    % cl2 p6 5
    R2.*8 |
    \mBreak
    
    % cl2 p6 6
    fis2.~(\f\> |
    fis2. |
    \mark #27 h8)\pp r r r4 r8 |
    R2.*2 
    r4 r8 h4.(\mf\> |
    a4. g |
    fis8)\! r r r4 r8 |
    \mBreak
    
    % cl2 p7 1
    R2.*2 |
    \mark #28
    R2. |
    fis,2.~( |
    fis4. g |
    d'2.~ |
    d4.) r4 r8 |
    \mBreak
    
    % cl2 p7 2
    R2.*4
    \mark #29
    fis2.~\f\> |
    \mBreak
    
    % cl2 p7 3
    fis2. |
    fis4.\p eis8( e eis) |
    fis4. eis8( e eis) |
    fis4.( eis) |
    e4.\(\< h'\> |
    \mBreak
    
    % cl2 p7 4
    a4. g8( h g)\) |
    ais2.(\p |
    fis2.) |
    R2. |
    \mark #30
    R2.*7 |
    \mark #31
    R2.*1

    % cl2 p7 5
    R2.*6
    \mark #32
    R2.*6
    \bar "|."
  }
}

clarinet_bass = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-numbers
  \accidentalStyle Score.modern-cautionary
  \defaultTimeSignature
  \compressEmptyMeasures
  \time 6/8
  \tempo "Andante"
  \key d \major
  \clef violin
  \relative c'' {
    % clb p3 1
    \mark #19
    R2.*6 |
    \mark #20
    R2.*7 |
    \mark #21
    R2.*6 |
    \mark #22
    R2.*10 |
    \mark #23
    R2.*6 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*3 |
        \revert MultiMeasureRest.staff-position
      }
      % Transposition adapted to clarinet (written in Bb ??)
      \new CueVoice \transpose a b \relative {
        \stemUp
        eis''4.(^"Ob." dis4 cis8) |
        his8.( cis16 his8 dis cis his |
        cis4.) a4 r8 |
        \stemNeutral
      }
    >>
    \mBreak
    
    % clb p3 2
    \mark #24
    \startMeasureCount h,2.~\p^"Cl.Bass." |
    \repeat unfold 5 { h2.~ } \stopMeasureCount|
    h8 r r r4 r8 |
    R2. |
    \mark #25
    R2.*9
    \mBreak
    
    % clb p3 3
    \mark #26
    R2.*2 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*2 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose c c \relative {
        \stemUp
        dis''4.~(\mf\<^"Clar.I." dis8 d dis) |
        e4( h'8) e,4\! r8 |
        \stemNeutral
      }
    >>
    a'2.~(\f\>^"Cl.Bass." |
    a2. |
    \mark #27
    gis8)\pp r8 r r4 r8 |
    R2.*2 |
    \mBreak
    
    % clb p3 4
    r4 r8 e4.(\mf\> |
    fis4. h |
    fis8)\! r r r4 r8 |
    R2.*2 |
    \mark #28
    R2.*5 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2.*4 |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose c c \relative {
        \stemUp
        c''4.~(^"Clar.I."\< c8 h c) |
        cis8.( gis'16) cis,8 cis4 r8 |
        \mBreak
        
        % clb p3 5
        dis4.~( dis8 d dis) |
        e8.( h'16) e,8\! e4 r8 |
        \stemNeutral
      }
    >>
    \mark #29
    a2.~\f^"Clar.Bass" |
    a2. |
    h,4-.\pp h8-. h4-. h8-. |
    h4-. h8-. h4-. h8-. |
    \mBreak
    
    % clb p3 6
    h4-. h8-. h4-. h8-. |
    h8 r r e4.(\mf\> |
    fis4. h4.) |
    b,2.~\p |
    b2.~ |
    b8 r r r4 r8 |
    \mBreak
    
    % clb p4 1
    \mark #30
    R2.*7 |
    \mark #31
    R2.*2 |
    <<
      {
        R2.*2 |
        c'8\rest ais4(\p\>^"Clar.Bass" dis, e8\! |
        \mBreak
      }
      \new CueVoice \transpose c c \relative {
        \stemDown
        fis4.(\pp\<^"Clar.I" g |
        d'4.~d4\> c8 |
        % Note that h ais is indeed correct (as in clarinet 1 - the cue notes here are wrong)
        h8 ais)\! s8 s4 s8 |
        \stemNeutral
      }
    >>
    
    % clb p4 2
    h4.) r4 r8 |
    R2. |
    \mark #32
    R2. |
    % The piano is missing in the printed voice
    h4--\p\>\solo h8 h4-- h8~\! |
    h8 r r r4 r8 |
    h2.\pp~ |
    h4. r4 r8 |
    R2.\fermata |
    \mBreak

    \bar "|."
  }
}

saxophone_alto = {
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
        \voiceTwo
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
    f8 as g \appoggiatura { f16 g } f8 des f |
    \mBreak
    
    % sax p2 2
    f4) c8( es4.~ |
    es8 des c \appoggiatura c des c b |
    c8-> f,4~ f4.~ |
    f8 g as \appoggiatura { b16 c } b8 as g |
    \mark #21
    a4. f~ |
    \mBreak
    
    % sax p2 3
    f4) r8 r4 r8 |
    R2.*3 |
    r4 r8 r4 c'8( |
    \mark #22
    f2.~ |
    f8 as g \appoggiatura { f16 g } f8 des f |
    f4) c8( des4.~ |
    \mBreak
    
    % sax p2 4
    des8\< es f ges as b\! |
    es,4.~ es8\> f ges |
    f4) c8( f4 es8\! |
    des4. c8 b as) |
    g8.( as16) g8-- b8( as) g |
    \mBreak
    
    % sax p2 5
    as4.( f4.~ |
    f4) r8 r4 r8 |
    \mark #23
    R2.*6 |
    c'4.(\espress b4 as8) |
    g8.( as16) g8-- b8( as) g |
    \mBreak
    
    % sax p2 6
    as4.( f4) r8 |
    \mark #24
    R2.*6 |
    c'4.(\espress b4 as8) |
    g8.( as16) g8-- b8( as) g |
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
      \new CueVoice \transpose c c \relative {
        \stemUp
        c''4.--^"Oboe" h8( b h) |
        c4.-- h8( b h) |
        c4.( h |
        b4.) f'( |
        es4. des) |
        \stemNeutral
      }
    >>
    c'4.(\espress^"Sax" b4 as8) |
    \mBreak
    
    % sax p2 8
    g8.( as16) g8-- b8( as) g |
    as4.( f4) r8 |
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
      \new CueVoice \transpose c c \relative {
        \stemUp
        \voiceOne
        r4.^"Oboe" f''4.( |
        es4. des8 f es) |
        \stemNeutral
      }
    >>
    \mBreak
    
    % sax p2 9
    c'4.(\espress^"Sax" b8 c as) |
    g8.( as16) g8 b8( as g) |
    R2. |
    \mark #30
    R2.*6 |
    <<
      {
        \override MultiMeasureRest.staff-position = #-6
        R2. |
        \revert MultiMeasureRest.staff-position
      }
      \new CueVoice \transpose c c \relative {
        \stemDown
        \voiceTwo
        g'8.(^"Viol.I" as16) g8-- b8( as) g | 
        \stemNeutral
      }
    >>
    \mark #31
    r4 r8 r4^"Sax" c8(\pp\espress |
    \mBreak
    
    % sax p2 10
    f2.~)( |
    f8\< as g \appoggiatura { f16 g } f8 des f |
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

% ---------------------------------------------------------

\bookpart {
  \header{
    instrument = "Klarinette I und II in A"
  }
  \score {
    \new GrandStaff <<
      \new Staff {
        \transpose a a \clarinet_I
      }
      \new Staff {
        \transpose a a \clarinet_II
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
      \transpose a a \clarinet_bass
    }
  }
}

\bookpart {
  \header{
    instrument = "Altsaxophon in Es"
  }
  \score {
    \new Staff {
      \transpose es es \saxophone_alto
    }
  }
}
