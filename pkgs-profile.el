;;; pkgs-profile.el --- Packages Profile  -*- lexical-binding: t; -*-

(orgCmntBegin "
* Summary: Library to process Doom packages profile.
" orgCmntEnd)

;;;#+BEGIN: b:elisp:file/copyLeftPlus :outLevel 1
(orgCmntBegin "
* Libre-Halaal Software --- Part Of Blee ---  Poly-COMEEGA Format.
** This is Libre-Halaal Software. © Libre-Halaal Foundation. Subject to AGPL.
** It is not part of Emacs. It is part of Blee.
** Best read and edited  with Poly-COMEEGA (Polymode Colaborative Org-Mode Enhance Emacs Generalized Authorship)
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN: b:elisp:file/authors :authors ("./inserts/authors-mb.org")
(orgCmntBegin "
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN: b:elisp:file/orgTopControls :outLevel 1
(orgCmntBegin "
*  ~ORG-TOP-CONTROLS-COME-HERE~
" orgCmntEnd)
;;;#+END:

(orgCmntBegin "
* Relevant Panels:
** [[file:/bisos/panels/blee-core/mail/Gnus/_nodeBase_/fullUsagePanel-en.org]]
* Planned Improvements:
*

" orgCmntEnd)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "REQUIRES" :extraInfo "Imports"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _REQUIRES_: |]]  Imports  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;(require 'blee-libs)

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 1 :title "Variables And Constants" :extraInfo "defvar, defcustom"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_       [[elisp:(outline-show-subtree+toggle)][| *Variables And Constants:* |]]  defvar, defcustom  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

(defvar pkg:straight:explicit:specification
  '()
   " #+begin_org
** TODO INCOMPLETE -- =pkg:straight:explicit:specification= One package's pkgName & commitHash for an explicit straight use package.
#+end_org "
  )


(defvar b:pkgsProfile:orphan
  nil
  " #+begin_org
** =b:pkgsProfile:orphan= Used to record orphan packages. These have not been assigned a profile
and don't have a commitHash.
#+end_org "
  )

(defvar b:pkgsProfile:collection:default
  `(
    )
   " #+begin_org
** =b:pkgsProfile:collection:default= list of packages and their versions.
#+end_org "
  )

;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "b:pkgsProfile:" :extraInfo ""
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _b:pkgsProfile:_: |]]    [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:file:read|prepare"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:file:read|prepare>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:file:read|prepare (
;;;#+END:
                                         <pkgsProfileSymbol)
   " #+begin_org
** DocStr: Read from *<pkgsProfileSymbol* file and capture that as ~:pkgsList~ symbol property.
#+end_org "
   (let* (
          ($pkgsProfile (eval <pkgsProfileSymbol))
          ($pkgsListIntake)
         )
     (message (format "b:pkgsProfile:file:read|prepare :: Preparing %s :: Reading %s"
                      (get <pkgsProfileSymbol ':profileName)  $pkgsProfile))

     (setq $pkgsListIntake (b:read|fromFile $pkgsProfile))
     (put <pkgsProfileSymbol ':pkgsList $pkgsListIntake)))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:file:read|prepare 'b:pkgsProfile:blee3:native)
#+END_SRC

#+RESULTS:

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:pkgsProfile:collection|prepare"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =cl-defun= <<b:pkgsProfile:collection|prepare>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(cl-defun b:pkgsProfile:collection|prepare (
;;;#+END:
                                            &optional <pkgsProfilesCollection)
   " #+begin_org
** DocStr: Prepare and initialize the given *<pkgsProfilesCollection* or *b:pkgsProfile:collection:default*.
Walk through the pkgsProfiles of specified collection and read them in and add them to ~straight-profiles~.
#+end_org "
  (let* (
         ($pkgsProfilesCollection <pkgsProfilesCollection)
         ($profileName)
         ($profileSymb)
         )
    (unless $pkgsProfilesCollection (setq $pkgsProfilesCollection b:pkgsProfile:collection:default))
    (unless $pkgsProfilesCollection (error "Missing pkgsProfilesCollection") (cl-return nil))

    (loop-for-each  $profileSymb $pkgsProfilesCollection
        (b:pkgsProfile:file:read|prepare $profileSymb)
        (setq $profileName (get $profileSymb ':profileName))
        (setq $profileNameSymb (intern $profileName))
        (add-to-list
         'straight-profiles
         `(,$profileNameSymb . ,(s-lex-format "${$profileName}.el"))
         t))
    ;;; Next we initialize orphan profile for those not found above.
    (setq $profileName (get b:pkgsProfile:orphan ':profileName))
    (setq $profileNameSymb (intern $profileName))
    (add-to-list
     'straight-profiles
         `(,$profileNameSymb . ,(s-lex-format "${$profileName}.el"))
         t)))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(progn (setq b:pkgsProfile:collection:default b:pkgsProfile:blee3:all) (b:pkgsProfile:list|prepare))
#+END_SRC

#+RESULTS:

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:pkg|obtainInfo"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:pkg|obtainInfo>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:pkg|obtainInfo (
;;;#+END:
                                     <pkgsProfileSymbol <pkgName)
   " #+begin_org
** DocStr: Given *<pkgsProfileSymbol* return info for *<pkgName*.
Type of *<pkgName* is a string. The returned info is the commitHash associated with *<pkgName*.
#+end_org "
   (let* (
          ($pkgsList (get <pkgsProfileSymbol ':pkgsList))
          ($pkgInfo (assoc <pkgName $pkgsList))
         )
     (cdr $pkgInfo)
     ))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg|obtainInfo 'b:pkgsProfile:frmWrk:example \"add-node-modules-path\")
#+END_SRC

#+RESULTS:
: 7d9be65b3be062842b7ead862dec15d6f25db4a2

" orgCmntEnd)



;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:explicit:straight--lockfile-read-all|advice"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:explicit:straight--lockfile-read-all|advice>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:explicit:straight--lockfile-read-all|advice (
;;;#+END:
                                                                <origFunc &rest <args)
   " #+begin_org
** TODO INCOMPLET DocStr: This is the package specific special purpose around advice-add for straight--lockfile-read-all.
The original straight--lockfile-read-all comes first. The ~pkg:straight:explicit:specification~ is added to it.
#+end_org "
   (append (apply <origFunc <args) ; lockfiles still take priority
           pkg:straight:explicit:specification))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:blee3+:straight--lockfile-read-all|advice 'straight--lockfile-read-all)
#+END_SRC
" orgCmntEnd)


;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "b:pkgsProfile:collection advice" :extraInfo "around straight--lockfile-read-all"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _b:pkgsProfile:collection advice_: |]]  b:pkgProfile on top of straight  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:collection:straight--lockfile-read-all|advice"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:collection:straight--lockfile-read-all|advice>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:collection:straight--lockfile-read-all|advice (
;;;#+END:
                                                                <origFunc &rest <args)
   " #+begin_org
** DocStr: This is a special purpose around advice-add for straight--lockfile-read-all.
A combined pinned-list of packages is added to the original list.
The original straight--lockfile-read-all comes first.
#+end_org "
   (append
    (apply <origFunc <args) ; lockfiles still take priority
    (b:pkgsProfile:collection:straight|aggregate b:pkgsProfile:collection:default)))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:blee3+:straight--lockfile-read-all|advice 'straight--lockfile-read-all)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:collection:straight--lockfile-read-all|advice-add"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:collection:straight--lockfile-read-all|advice-add>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:collection:straight--lockfile-read-all|advice-add (
;;;#+END:
                                                                        )
   " #+begin_org
** DocStr: Actions based on =parameters= and *returnValues*
and side-effects are documented here
#+end_org "

   (advice-add 'straight--lockfile-read-all :around #'b:pkgsProfile:collection:straight--lockfile-read-all|advice)
   )

;;; (straight--lockfile-read-all)
(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgs)
#+END_SRC
" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:collection:straight--lockfile-read-all|advice-remove"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:collection:straight--lockfile-read-all|advice-remove>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:collection:straight--lockfile-read-all|advice-remove (
;;;#+END:
                                                                           )
   " #+begin_org
** DocStr: Actions based on =parameters= and *returnValues*
and side-effects are documented here
#+end_org "

   (advice-remove 'straight--lockfile-read-all :around #'b:pkgsProfile:collection:straight--lockfile-read-all|advice)
   )

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgs)
#+END_SRC
" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkgsProfile:collection:straight|aggregate"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkgsProfile:collection:straight|aggregate>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkgsProfile:collection:straight|aggregate (
;;;#+END:
                                          <defaultCollection)
   " #+begin_org
** DocStr: Based on contents of /bisos/blee/profile/blee3 read all relevant files and convert to list.
NOTYET, TO-BE-OPTIMIZED. this does not need to be computed everytime.
#+end_org "
   (let* (
          ($pkgsListIntake)
          ($result ())
         )
     (dolist ($profileSymb <defaultCollection)
       (when (not (member ':pkgsList (symbol-plist $profileSymb)))
         (message (format "Preparation Of :: %s" $profileSymb))
         (b:pkgsProfile:file:read|prepare $profileSymb))
       (setq $result (append $result (get $profileSymb ':pkgsList)))
       )
     $result))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
;; (get 'b:pkgsProfile:blee3:doom3 ':pkgsList)
(b:pkgsProfile:blee3|pinnedListAll)
#+END_SRC
" orgCmntEnd)



;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "b:pkg:straight" :extraInfo "b:pkgProfile on top of straight"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_  _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_     [[elisp:(outline-show-subtree+toggle)][| _b:pkg:straight_: |]]  b:pkgProfile on top of straight  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:


;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:pkg:straight|install"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =cl-defun= <<b:pkg:straight|install>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(cl-defun b:pkg:straight|install (
;;;#+END:
                                  <pkgSymb &optional <pkgsProfilesCollection)
   " #+begin_org
** TODO DocStr: For a given *<pkgSym* and perhaps a given *<pkgsProfilesCollection*, first try ~b:pkg:straight|profiledInstall~, if that fails, try ~b:pkg:straight|orphanInstall~.
*b:pkg:straight|install* is the  =PRIMARY-USE-INTERFACE= of b:pkg:straight| set.
#+end_org "
  (let* (
         ($pkgsProfilesCollection <pkgsProfilesCollection)
         ($pkgName (symbol-name <pkgSymb))
         ($result nil)
         ($pkgsProfile)
         )
    (unless $pkgsProfilesCollection (setq $pkgsProfilesCollection b:pkgsProfile:collection:default))
    (unless $pkgsProfilesCollection (error "Missing pkgsProfilesCollection") (cl-return nil))

    (setq $pkgsProfile (b:pkg:straight:anyProfile|isIn? $pkgName $pkgsProfilesCollection))

    (if $pkgsProfile
        (progn
         (setq $result (b:pkg:straight|profiledInstall $pkgsProfile <pkgSymb)))
      (progn
        (message (format "pkg=%s not found in anyProfile." $pkgName))
        (b:pkg:straight|orphanInstall <pkgSymb)
        )
     )))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkgs:straight|install 'add-node-modules-path)
#+END_SRC

#+RESULTS:

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:pkg:straight|orphanInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =cl-defun= <<b:pkg:straight|orphanInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(cl-defun b:pkg:straight|orphanInstall (
;;;#+END:
                                        <pkgSymb)
   " #+begin_org
** DocStr: For *<pkgSymb* with ~b:pkgsProfile:orphan~ profile, run ~b:pkg:straight|profiledInstall~.
*** TODO The determinaltion that *<pkgSymb* is in fact orphan should perhaps be validated.
#+end_org "
  (let* (
         ($pkgName (symbol-name <pkgSymb))
         ($result nil)
         )
    (unless b:pkgsProfile:orphan (error "Missing b:pkgsProfile:orphan") (cl-return nil))

    (setq $result (b:pkg:straight|profiledInstall b:pkgsProfile:orphan <pkgSymb))))


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|orphanInstall 'add-node-modules-path)
#+END_SRC

#+RESULTS:

" orgCmntEnd)



;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:pkg:straight:explicit|install"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =cl-defun= <<b:pkg:straight:explicit|install>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(cl-defun b:pkg:straight:explicit|install (
;;;#+END:
                                          <pkgName
                                          &key
                                          (ref nil)
                                          (pkgsProfileSymbol nil)
                                          )
   " #+begin_org
** TODO INCOMPLETE DocStr: Explicitly install a package with straight, but this does not apply to its dependencies.
Things can become complicated with named-pkgs-profile.
*** TODO b:pkg:straight:explicit|install has not been implemented or tested yet.
#+end_org "
   (let* (
          (<ref ref)
          (<pkgsProfileSymbol pkgsProfileSymbol)
          ($profileName (get <pkgsProfileSymbol ':profileName))
          ($origCurProfile straight-current-profile)
          ($result)
          )
     (unless <ref (error "<ref is mandatory") (cl-return nil)) ;;; Mandatory kw-arg

     (message "INCOMPLETE, skipped")
     (cl-return nil)

     ;;; NOT EXECUTED. Needs implementation and testing.

     (setq pkg:straight:explicit:specification '())
     (push '(<pkgName . <ref) pkg:straight:explicit:specification)

     (advice-remove 'straight--lockfile-read-all :around #'b:straight--lockfile-read-all|advice)
     (advice-add 'straight--lockfile-read-all :around #'b:straight--lockfile-read-all|advice)

     (when $profileName
       (setq straight-current-profile (intern $profileName)))

     ;; Install the package if needed
     (setq $result (straight-use-pkg <pkgName))

     ;; Restore things back to how they were
     (advice-remove 'straight--lockfile-read-all :around #'b:straight--lockfile-read-all|advice)
     (setq straight-current-profile $origCurProfile)
     $result))



(orgCmntBegin "
** TODO Basic Usage: INCOMPLETE
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg:straight|install 'doom:3.0.0.alpha 'add-node-modules-path)
#+END_SRC

#+RESULTS:


" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|ephemeraInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|ephemeraInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|ephemeraInstall (
;;;#+END:
                                           <pkgsProfileSymbol <pkgName &optional <ref)
   " #+begin_org
** TODO DocStr: INCOMPLETE. Install but make sure it is orphan and that it remains orphan.
#+end_org "
  (let* (
         ($profilePkgRef (b:pkgsProfile:pkg|obtainInfo <pkgsProfileName <pkgName))
         )
    (message "INCOMPLETE, skipped")
     (cl-return nil)

    (message "straight-use-package with profileName, pkgName and commitHash comes here.")
     ))


(orgCmntBegin "
** TODO Basic Usage: INCOMPLETE
#+BEGIN_SRC emacs-lisp
(b:pkgsProfile:pkg:straight|install 'doom:3.0.0.alpha 'add-node-modules-path)
#+END_SRC

#+RESULTS:

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/cl-defun :defName "b:pkg:straight|profiledInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =cl-defun= <<b:pkg:straight|profiledInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(cl-defun b:pkg:straight|profiledInstall (
;;;#+END:
                                          <pkgsProfileSymbol <straightArg &rest <straightOptArgs)
   " #+begin_org
** DocStr: Set ~straight-current-profile~ to *<pkgsProfileSymbol* and run ~straight-use-package~ with *<straightArg*.
This is the primary function that invokes ~straight-use-package~.
When *<straightArg* is a list, (MELPA-STYLE-RECIPE), the symbol naming a package is its first member.
That is extracted and used to identify subjectPackage.
#+end_org "
   (let* (
          ($pkgName)
          ($profileName (get <pkgsProfileSymbol ':profileName))
          ($result nil)
          )
     (unless $profileName (error "$profileName is mandatory") (cl-return nil))

     (if (listp <straightArg)
         (setq $pkgName (symbol-name (cl-first <straightArg)))
       (setq $pkgName (symbol-name <straightArg)))

     (let (
           (straight-current-profile (intern $profileName))
           )
       ;; Install the package
       (message (format "b:pkg:straight|profiledInstall profile=%s pkg=%s arg=%s optArgs=%s"
                        $pkgName $profileName <straightArg <straightOptArgs))
       (if <straightOptArgs
           (setq $result (straight-use-package <straightArg <straightOptArgs))
         (setq $result (straight-use-package <straightArg)))
       )
     $result))

(orgCmntBegin "
** Basic Usage:
(get 'b:pkgsProfile:blee3:doom3 ':profileName)
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|profiledInstall 'add-node-modules-path 'b:pkgsProfile:blee3:doom3)
#+END_SRC

#+RESULTS:

" orgCmntEnd)



;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight:anyProfile|isIn?"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight:anyProfile|isIn?>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight:anyProfile|isIn? (
;;;#+END:
                                        <pkgName <pkgsProfilesList)
   " #+begin_org
** DocStr: Find *<pkgName* in any of *<pkgsProfilesList*, return that profile when found. nil otherwise.
*** TODO rename it to b:pkgProfile:collection|isIn? --- This is not straight specific at all.
*** TODO We also need b:pkgProfile:collection:profileName|isIn?
#+end_org "
   (let* (
          ($pkgsList)
          ($pkgInfo)
          ($result nil)
         )
     (loop-for-each  $profileSymb <pkgsProfilesList
       (setq $pkgsList (get $profileSymb ':pkgsList))
       (unless $pkgsList (loop-break))
       ;;(message (format "Processing %s" $profileSymb))
       (setq $pkgInfo (assoc <pkgName $pkgsList))
       (when $pkgInfo
         (setq $result $profileSymb)
         (loop-break)))
     $result))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
;;; (get 'b:pkgsProfile:blee3:doom3 ':pkgsList)
(b:pkg:straight:anyProfile|isIn? (symbol-name 'add-node-modules-path) b:pkgsProfile:blee3:all)
#+END_SRC

#+RESULTS:
: b:pkgsProfile:blee3:doom3

" orgCmntEnd)


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|anyProfile:install"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|anyProfile:install>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|anyProfile:install (
;;;#+END:
                                          <pkgName <pkgsProfilesCollection)
   " #+begin_org
** TODO DocStr: If *<pkgName* is in any of *<pkgsProfilesCollection* install it. Otherwise, note that it was not found.
#+end_org "
   (let* (
          ($pkgsProfile (b:pkg:straight:anyProfile|isIn? <pkgName <pkgsProfilesCollection))
          ($result nil)
          )
     (if $pkgsProfile
         (setq $result (b:pkg:straight|profiledInstall <pkgName $pkgsProfile))
       (message "<pkgName not found in anyProfile.")
       )
     $result))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|anyProfile:install (symbol-name 'add-node-modules-path) b:pkgsProfile:blee3:all)
#+END_SRC

#+RESULTS:
: b:pkgsProfile:blee3:doom3

" orgCmntEnd)



;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|latestInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|latestInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|latestInstall (
;;;#+END:
                                     <pkgName)
   " #+begin_org
** TODO NOT-IMPLEMENTED DocStr: Using the default pkgsProfileName, install *<pkgName* with straight.
#+end_org "
   (message "NOTYET")
   )


(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|latestInstall 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: NOTYET

" orgCmntEnd)

;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:straight|forDevInstall"
(orgCmntBegin "
* [[elisp:(show-all)][(>]]  =defun= <<b:pkg:straight|forDevInstall>> [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
(defun b:pkg:straight|forDevInstall (
;;;#+END:
                                     <pkgName)
   " #+begin_org
** DocStr: Using the default pkgsProfileName, install *<pkgName* with straight.
#+end_org "
   (message "NOTYET")
   )

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:straight|forDevInstall 'add-node-modules-path)
#+END_SRC

#+RESULTS:
: NOTYET

" orgCmntEnd)


;;;#+BEGIN: blee:bxPanel:foldingSection :outLevel 0 :title "b:pkg:forked" :extraInfo ""
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*     [[elisp:(outline-show-subtree+toggle)][| _b:pkg:forked_: |]]    [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;;#+END:


;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:forked|is?"
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  defun      [[elisp:(outline-show-subtree+toggle)][||]]  <<b:pkg:forked|is?>>  --  --   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(defun b:pkg:forked|is? (
;;;#+END:
                         <pkgSymb)
   " #+begin_org
** TODO DocStr: For a given *<pkgSym* determine if a forked environment exists
#+end_org "
  (let* (
         ($pkgName (symbol-name <pkgSymb))
         ($forkedBaseDir (b:pkg:forked|basedir <pkgSymb))
         ($result nil)
         )
    (when (file-directory-p $forkedBaseDir)
        (setq $result t))
    $result))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:forked|is?  'subed)
#+END_SRC

#+RESULTS:

" orgCmntEnd)



;;;#+BEGIN:  b:elisp:defs/defun :defName "b:pkg:forked|basedir"
(orgCmntBegin "
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  defun      [[elisp:(outline-show-subtree+toggle)][||]]  <<b:pkg:forked|basedir>>  --  --   [[elisp:(org-cycle)][| ]]
" orgCmntEnd)
(defun b:pkg:forked|basedir (
;;;#+END:
                             <pkgSymb )
   " #+begin_org
** TODO DocStr: For a given *<pkgSym* determine if a forked environment exists
#+end_org "
  (let* (
         ($pkgName (symbol-name <pkgSymb))
         )
    (s-lex-format "/bisos/git/bxRepos/forked/${$pkgName}")
    ))

(orgCmntBegin "
** Basic Usage:
#+BEGIN_SRC emacs-lisp
(b:pkg:forked|basedir  'subed)
#+END_SRC

#+RESULTS:
: /bisos/git/bxRepos/forked/subed

" orgCmntEnd)




;;;#+BEGIN: b:elisp:file/provide :modName nil
(provide 'pkgs-profile)
;;;#+END:

;;;#+BEGIN: b:elisp:file/endOf :outLevel 1
(orgCmntBegin "
* [[elisp:(show-all)][(>]] ~END-OF-FILE~  [[elisp:(org-shifttab)][<)]] E|
" orgCmntEnd)
;;; local variables:
;;; no-byte-compile: t
;;; end:
;;;#+END:
