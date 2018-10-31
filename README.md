 Compare-UserJS
================

<br>

Index
:------------------
[:fast_forward: **Requirements**][2]
[:fast_forward: **Instructions**][3]
[:fast_forward: **Parameters**][4]
[:fast_forward: **Examples and tips**][5]
[:fast_forward: **Acknowledgements**][6]
[:fast_forward: **Glossary**][7]
[:fast_forward: **F.A.Q.**][8]

<br>

This script uses my own elegant <sup>[<i>Citation needed.</i>]</sup>  algorithm for parsing *user.js* files, and by default logs the results to *userJS_diff.log*.

Information provided by this script:

- matching prefs, both value and state.
- prefs with different values but matching state.
- prefs declared in file A but not in file B, and vice versa.
- inactive in A but active in B, and vice versa.
- duplicates in each of the two source files.

Additionally, it can catch one type of syntax error (for now), and includes that information in the report.

You can see an example of what the output looks like [here](userJS_diff.log).

[:top:][1]


 Requirements
---------------

PowerShell version 2 or higher, which comes pre-installed on Windows 7, but it *should* also run fine on Unix-like systems. You can download the latest version from the official [PowerShell repository][ps].


 Instructions
---------------

The easiest way to use this tool:
1. Download copies of both [*Compare-UserJS.bat*][bat] and [*Compare-UserJS.ps1*][ps1].
2. Place them in the same folder.
3. Drag and drop the two files that you want to compare on the *Compare-UserJS.bat*, simultaneously.

The *Compare-UserJS.bat* works as a launcher that makes it easier to run the PowerShell script. If you can't or don't want to use said batchfile, you will have to either relax the execution policy before starting ([see the examples][5]), or manually create a new blank ps1 file and copy the text of this PowerShell script in it. In fact, you may even have to do both, depending on your system's configuration.

Compare-UserJS requires two parameters: the paths of the two files to be compared. You can pass them directly from the console/terminal, but that is not strictly necessary because the script will prompt you to enter them during execution if you don't.

See the embedded help info with:
```PowerShell
Get-Help .\Compare-UserJS -full
```

Or just read it from the file, but that's less thrilling.

[:top:][1]


 Parameters
--------------

|**Index** |   **Name**    | **Required?** |    **Default**    |                        **Description**                        |
|:--------:|:-------------:|:-------------:|:-----------------:|---------------------------------------------------------------|
|    0     | `filePath_A`  |      Yes      |                   | Path to the first file to compare. (1)                        |
|    1     | `filePath_B`  |      Yes      |                   | Path to the second file to compare.                           |
|    2     |  `ouputFile`  |      No       | *userJS_diff.log* | Path to the file where the report will be dumped.             |
|    3     |   `append`    |      No       |       false       | Append the report to the end of the file if it already exists.|
|    4     | `noCommentsA` |      No       |       false       | Parse JS comments in file A as code. (2)                      |
|    5     | `noCommentsB` |      No       |       false       | Parse JS comments in file B as code.                          |
|    6     |  `hideMask`   |      No       |         0         | Bitmask value for hiding parts of the report selectively. (3) |
|    7     |    `inJS`     |      No       |       false       | Get the report written in JavaScript. (4)                     |

<sub><em>
  1 - All path parameters can be absolute or relative. <br>
  2 - Mostly deprecated. It should make parsing slightly faster with files that you know beforehand that don't have comments. <br> 
  3 - See the embedded help info for details. <br>
  4 - It will be written to userJS_diff.js unless the -outputFile parameter is also specified.
</em></sub>

[:top:][1]


 Examples and tips
-------------------

Starting PowerShell from the console (may vary):
```Batchfile
PowerShell.exe
```

Checking the current execution policy (from PowerShell):
```PowerShell
Get-ExecutionPolicy
```

Relaxing the execution policy:
```PowerShell
# pick one or the other
Set-ExecutionPolicy RemoteSigned
Set-ExecutionPolicy Unrestricted
```

Alternatively, call the script like this:
```Shell
PowerShell.exe -ExecutionPolicy Bypass -Command "& 'Compare-UserJS.ps1'"
```

Comparing fileA to fileB:
```PowerShell
.\Compare-UserJS.ps1 "C:\absolute\path\to\fileA" "..\relative\path\to\fileB"
```

Comparing fileA to fileB, and saving the report to *report.txt*, appending to the end of the file:
```PowerShell
.\Compare-UserJS.ps1 "fileA.js" "fileB.js" -outputFile "report.txt" -append
```

This tool can help you make manual cleanups of your *prefs.js* too!
```PowerShell
.\Compare-UserJS.ps1 prefs.js user.js -hideMask 502 -inJS
```

Passing any parameters to the BAT is the same, except that you don't need the `.\`
```Batchfile
Compare-UserJS.bat "fileA.js" "fileB.js"
```

[:top:][1]


 Acknowledgements
-------------------
[Thorin-Oakenpants][p] and [earthlng][e] for their valuable feedback on the initial stages of this little project.


 Glossary
-----------
- state (active/inactive): Whether a pref was declared within the context of a JavaScript comment or not.
- user.js: Configuration file used by Firefox. You can find more information [here][article] and [here][wiki]. In the context of this project, this refers (to a limited extent) to all configuration files sharing the same syntax, including *prefs.js* and *all.js*. I strongly encourage you to check out the [ghacks user.js][g-u.js] if you haven't already.


 F.A.Q. <sub><sup><sub>(assuming it counts when I'm the one asking)<sub></sup></sub>
----------------------------

- **Why the heck did you make this?**
    - Firstly, to prove myself that I can produce nearly-awe-inducing garbage in under ~~200~~ 500 lines of code (I wish). Secondly, I have some shit to compare. Thirdly, I'm (still) hooked on regular expressions. Fourthly, for learning purposes.
<br>

[:top:][1]


[1]: https://github.com/claustromaniac/Compare-UserJS#Compare-UserJS
[2]: https://github.com/claustromaniac/Compare-UserJS#requirements
[3]: https://github.com/claustromaniac/Compare-UserJS#instructions
[4]: https://github.com/claustromaniac/Compare-UserJS#parameters
[5]: https://github.com/claustromaniac/Compare-UserJS#examples-and-tips
[6]: https://github.com/claustromaniac/Compare-UserJS#acknowledgements
[7]: https://github.com/claustromaniac/Compare-UserJS#glossary
[8]: https://github.com/claustromaniac/Compare-UserJS#faq-assuming-it-counts-when-im-the-one-asking

[article]: https://developer.mozilla.org/en-US/docs/Mozilla/Preferences/A_brief_guide_to_Mozilla_preferences
[bat]: https://raw.githubusercontent.com/claustromaniac/Compare-UserJS/master/Compare-UserJS.bat
[ps1]: https://raw.githubusercontent.com/claustromaniac/Compare-UserJS/master/Compare-UserJS.ps1
[g-u.js]: https://github.com/ghacksuserjs/ghacks-user.js
[ps]: https://github.com/PowerShell/PowerShell
[wiki]: https://github.com/ghacksuserjs/ghacks-user.js/wiki/1.1-Overview#small_orange_diamond-what-is-it-what-does-it-do-and-why-would-i-want-one

[p]: https://github.com/Thorin-Oakenpants
[e]: https://github.com/earthlng