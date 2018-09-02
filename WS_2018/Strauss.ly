\version "2.18.2"
\language "deutsch"

\paper {
    top-margin = 10\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    ragged-last = ##t
}
  
\header{
  title = "Vier letzte Lieder"
  subtitle = "Frühling"
  composer = "Richard Strauss (1864 - 1949)"
  tagline = ""
}

% Adapt this for automatic line-breaks
mBreak = {}
% mBreak = { \break }
% #(set-global-staff-size 13)

% Useful snippets
pDolce = _\markup { \dynamic p \italic "dolce" }
pSubito = _\markup { \dynamic p \italic "subito" }
ppSubito = _\markup { \dynamic pp \italic "subito" }
pesante = _\markup {\italic {"pesante"} }
pocoRit = ^\markup {\italic {"poco rit."} }
moltoRit = ^\markup {\italic {"molto rit."} }
pocoAnimato = ^\markup {\italic {"poco animato"} }
pocoAPocoPiuAnimato = ^\markup {\italic {"poco a poco più animato"} }
lunga = _\markup {\italic {"lunga"} }
string = ^\markup {\italic {"string."} }
legato = _\markup {\italic {"legato"} }
solo = ^\markup { "Solo" }
sic = ^\markup { \tiny { "sic!" } }

%{
% Taken from LSR http://lsr.di.unimi.it/LSR/Item?id=266
% Minimize usage of accidentals (no double accidentals, no his, eis, ces, fes)
% Usage: \naturalizeMusic \transpose {...}
#(define (naturalize-pitch p)
   (let ((o (ly:pitch-octave p))
         (a (* 4 (ly:pitch-alteration p)))
         ;; alteration, a, in quarter tone steps,
         ;; for historical reasons
         (n (ly:pitch-notename p)))
     (cond
      ((and (> a 1) (or (eq? n 6) (eq? n 2)))
       (set! a (- a 2))
       (set! n (+ n 1)))
      ((and (< a -1) (or (eq? n 0) (eq? n 3)))
       (set! a (+ a 2))
       (set! n (- n 1))))
     (cond
      ((> a 2) (set! a (- a 4)) (set! n (+ n 1)))
      ((< a -2) (set! a (+ a 4)) (set! n (- n 1))))
     (if (< n 0) (begin (set! o (- o 1)) (set! n (+ n 7))))
     (if (> n 6) (begin (set! o (+ o 1)) (set! n (- n 7))))
     (ly:make-pitch o n (/ a 4))))
#(define (naturalize music)
   (let ((es (ly:music-property music 'elements))
         (e (ly:music-property music 'element))
         (p (ly:music-property music 'pitch)))
     (if (pair? es)
         (ly:music-set-property!
          music 'elements
          (map (lambda (x) (naturalize x)) es)))
     (if (ly:music? e)
         (ly:music-set-property!
          music 'element
          (naturalize e)))
     (if (ly:pitch? p)
         (begin
           (set! p (naturalize-pitch p))
           (ly:music-set-property! music 'pitch p)))
     music))
naturalizeMusic =
#(define-music-function (parser location m)
   (ly:music?)
   (naturalize m))
%}

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
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:subtitle
      "     -     "
      \fromproperty #'header:instrument
    }
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
  }
  evenHeaderMarkup = \markup
  \fill-line {
    \on-the-fly #print-page-number-check-first \fromproperty #'page:page-number-string
    \on-the-fly #part-not-first-page \fontsize #-1.0 \concat {
      \fromproperty #'header:title
      "     -     "
      \fromproperty #'header:subtitle
      "     -     "
      \fromproperty #'header:instrument
    }
    " "
  }
}

% ---------------------------------------------------------

clarinet_I_in_A_Music = {
  \relative c' {
    \transposition a
    \key es \major
    \numericTimeSignature
    \time 6/8
    \tempo "Allegretto"

    % cl 1 page 1 line 1
    \barNumberCheck #1
    r4. es8\p\( ges16 b, b' es |
    % Transposition: Actually fis
    h4.\) h,8\( d16 ges, ges' h |
    b4.\) es,8\( ges16 b, b' es |
    % Transposition: Actually fis
    h4.\) h,8\( d16 ges, ges' h |
    b8\pp\) r8 r8 r4. |
    \mBreak
    
    % cl 1 page 1 line 2
    \barNumberCheck #6
    R2.*3 |
    \mark #1
    r4. c4\pp\( f,8 |
    % Transposition: Actually fis
    ges4.~ ges8\) r8 r8 |
    R2. |
    r4. c,8\p\( e16 g? c\> e |
    g8\)\! r8 r8 g,8\p\( b16 des\> e g |
    b8\)\! r8 r8 r4. |
    \mBreak

    % cl 1 page 1 line 3
    \barNumberCheck #15
    R2.*2 |
    \mark #2
    % Transposition: Actually ces
    g,8\p\( b16 d, g d'\) as8\( h16 es, a cis |
    d16 f b\) r16 r8 r4. |
    r4. des,8\( f16 as, des as'\) |
    des,8\( ges16 b, des b'\) f8\( b16 des, as' des |
    \mBreak

    % cl 1 page 1 line 4
    \barNumberCheck #21
    b8\) r8 r8 r4. |
    R2. |
    ges,8\( b16 des, des' ges b4\< ces8 |
    ges4 es8 as,8 b4\)
    \mark #3
    es,8\f\( g16 b, b' es g4 c,8 |
    es2.\)
    \mBreak

    % cl 1 page 1 line 5
    \barNumberCheck #27
    ces4.\( des |
    es4 f\) r4 |
    R2.*4 |
    \mark #4
    % Transposition: Actually dis
    g4\p\( as8~ as a es |
    c'4 h8 e4.~ |
    e4 d8 c4 h8\) |
    h4.\( a\<\) |
    \mBreak

    % cl 1 page 1 line 6
    \barNumberCheck #37
    a4\p\( b8~ b h f |
    d'4 cis8 fis4.\pp~ |
    fis4 e8 d4 cis8\) |
    cis4\( h8 d4.~ |
    d4 f, g\< |
    % Transposition: Actually gis
    as a f |
    \mBreak

    % cl 1 page 1 line 7
    \barNumberCheck #43
    \mark #5
    % Transposition: Actually eis
    e4\) f8\p\(~ f fis h, |
    a'4 \< g8~ g fis f |
    % Transposition: Actually eis
    e4\) f8\(~ f fis h, |
    % Transposition: Actually gis
    a'4\> as8 h4 a8 |
    \bar "||" \time 9/8 
    \tempo "Etwas ruhiger"
    g4\)\pp r8 r4. r4. |
    % Transposition: Actually dis
    a,4.\pp\( b4 es,8 e4.~ | % FIXME: Really twice pp?
    \mBreak

    % cl 1 page 1 line 8
    \barNumberCheck #49
    e4~ e16 g c2. |
    e,2.\< g4.\) |
    \mark #6
    f8\!\ppSubito\( b as~ as16 e f as c des\) d4.\(~ |
    d4. es4 gis,8 a4.~ |
    \mBreak

    % cl 1 page 1 line 9
    \barNumberCheck #53
    a4~ a16 c f8\) r8 r8 a8-. r8 r8 |
    r8 a16\( f c8\) r8 g'16\(\< d b8\) r8 e16\( cis a8\) |
    e'2.~ e4.\! |
    R1*9/8 |
    \mBreak

    % cl 1 page 1 line 10
    \barNumberCheck #57
    % Transposition: Actually gis
    e,8\p\( as16 h, e as h4 e16 as\) as8.\( e16 as h\) |
    % Transposition: Actually gis
    h4(\< b8) b4( a8) a4\( as8 |
    \mark #7 g2.\)\p r4. |
    R1*9/8 * 3
    \mBreak

    % cl 1 page 2 line 1
    \barNumberCheck #63
    es,8\(\mf g16 b, b' es g4\< b16 es\) es4. |
    g,,8\f\( h16 d, d' g h4 d16 g\) g4.\(~ |
    g8 g,16 d h8\)\> r8 f'16\( d a8\) r8 d16\( h f8\) |
    \mark #8
    c8\p\( e16 g, g' c\) c4.\(~ c8 g16 e c8\) |
    \mBreak

    % cl 1 page 2 line 2
    \barNumberCheck #67
    R1*9/8 |
    c''4.\( des fis, |
    a4. g c\) |
    e2.~ e4.~ |
    e2.~ e4.~ |
    e4 r8 r4. r4. |
    \bar "|."
    \mBreak
    
    \barNumberCheck #73
  }
}

clarinet_II_in_A_Music = {
  \relative c' {
    \transposition a
    \key es \major
    \numericTimeSignature
    \time 6/8
    \tempo "Allegretto"

    % cl 2 page 1 line 1
    \barNumberCheck #1
    b4.\p~ b8 r8 r8 |
    h4.~ h8 r8 r8 |
    b4.~ b8 r8 r8 |
    h4.~ h8 r8 r8 |
    b4\pp~\( b16 es\) es4. |
    b4~\( b16 es\) es4.\( |
    \mBreak
    
    % cl 2 page 1 line 2
    \barNumberCheck #7
    d2.~ |
    d4.~ d4 fis16 b |
    \mark #1
    d4.\) g,4\pp\( des8 |
    d4.~ d8\) r8 r8 |
    a'4.~ a8 r8 r8 |
    c4.~ c8 r8 r8 |
    b2.\( |
    \mBreak

    % cl 2 page 1 line 3
    \barNumberCheck #14
    des2.~ |
    des2. |
    f,2.\) |
    \mark #2
    g4.\( as4 cis,8 |
    d4. as4 a8\) |
    b4.\pp\( ces4. |
    des4. ces4.\) |
    \mBreak

    % cl 2 page 1 line 4
    \barNumberCheck #21
    des8\p\( ges16 b, b' es\) es8\( f des |
    % Transposition: Actually ces
    ges4\) r8 h,,8\mf\( e16 g as h |
    es16 des ges b des8\) r4. |
    R2.|
    \mark #3
    R2.|
    \mBreak

    % cl 2 page 1 line 5
    \barNumberCheck #26
    es,,8\p\( g16 b, b' es\) es4. |
    es4\( f8 as b ges~ |
    ges8 ces c~\> c d b |
    es8\p\) r8 r8 r4.|
    R2.*3
    \mBreak

    % cl 2 page 1 line 6
    \barNumberCheck #33
    \mark #4
    e,4\p\( f8~ f fis c |
    % Transposition: Actually dis
    es4. e4.~ |
    e4 d8 c4.\) |
    g8.\( c16\< e g f4.\) |
    % Transposition: Actually dis, gis
    cis4\p\( d8~ d es as, |
    % Transposition: Actually eis
    f'4. fis4.\pp\) |
    \mBreak

    % cl 2 page 1 line 7
    \barNumberCheck #39
    % Transposition: Actually fis
    d,4\( ges16 a\) a4\( d16 ges\) |
    % Transposition: Actually fis
    ges4.\( f4. |
    % Transposition: Actually fis
    as4.~ as8 g\< ges |
    f8 e es d cis c\) |
    \mark #5
    d,2.\(\p |
    c2.\)\< |
    d2.\( |
    \mBreak
    
    
    % cl 2 page 1 line 8
    \barNumberCheck #46
    cis4.\> d4.\! |
    \bar "||" \time 9/8 
    \tempo "Etwas ruhiger"
    c8\pp e16 g, g' c\) c4\( g'16 e c8-.\) g16\( e c8-.\) |
    e4.\( f4 h,8 c4.~ |
    c8 e16 g, c e g2. |
    \mBreak

    % cl 2 page 1 line 9
    \barNumberCheck #50
    c4.\< h des~ |
    \mark #6
    des4.\!\ppSubito~ des8\) r8 r8 r4. |
    R1*9/8 |
    f,8\pp\( g16 c, f as c2.~ |
    c4\) r8 r4. r4. |
    \mBreak

    % cl 2 page 1 line 10
    \barNumberCheck #55
    % Transposition: Actually gis
    e,8\p\( as16 h,\< h' e\) e8\( as e h as e\)\! |
    R1*9/8*2 |
    % Transposition: Actually gis
    r8 e'16\p\<\( h as8\) r8 es'16\( b ges8\) r8 d'16\( as f8\) |
    \mBreak

    % cl 2 page 1 line 11
    \barNumberCheck #59
    \mark #7
    c'2.\!\pSubito\( g4.~ |
    g4. a e |
    f2.~ f4.\) |
    c''4\p\( h8\< d,4. des8 c ces |
    b4 g16 b es4 g16 b\) b4. |
    \mBreak

    % cl 2 page 2 line 1
    \barNumberCheck #64
    h,2.\f\(~ h4 c8 |
    d4 e8\> f4 g8 a4 h8 |
    \mark #8
    c4\p\) r8 g,2.\(~ |
    g4. c e\)
    \mBreak
       
    % cl 2 page 2 line 2
    \barNumberCheck #68
    % Transposition: Actually dis
    a4.\p\( b es, |
    d2. f4.\) |
    c'2.~ c4.~ |
    c2.~ c4.~ |
    c4 r8 r4. r4. |
    \bar "|."
    \mBreak
    
    \barNumberCheck #73
  }
}


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
      \new Voice {
        {
          \transpose b a
          \clarinet_I_in_A_Music
        }
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
      \set Score.markFormatter = #format-mark-box-alphabet
      \override DynamicLineSpanner.staff-padding = #3
      \accidentalStyle Score.modern-cautionary
      \new Voice {
        {
          \transpose b a
          \clarinet_II_in_A_Music
        }
      }
    }
  }
}
