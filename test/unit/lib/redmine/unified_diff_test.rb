# Copyright (C) 2006-2017  Jean-Philippe Lang
  def test_previous_file_name_with_git
    diff = Redmine::UnifiedDiff.new(<<-DIFF)
From 585da9683fb5ed7bf7cb438492e3347cdf3d83df Mon Sep 17 00:00:00 2001
From: Gregor Schmidt <schmidt@nach-vorne.eu>
Date: Mon, 5 Mar 2018 14:12:13 +0100
Subject: [PATCH] changes including a rename, rename+modify and addition

---
 one.markdown => one.md | 0
 three.md               | 2 ++
 two.markdown => two.md | 1 +
 3 files changed, 3 insertions(+)
 rename one.markdown => one.md (100%)
 create mode 100644 three.md
 rename two.markdown => two.md (50%)

diff --git a/one.markdown b/one.md
similarity index 100%
rename from one.markdown
rename to one.md
diff --git a/three.md b/three.md
new file mode 100644
index 0000000..288012f
--- /dev/null
+++ b/three.md
@@ -0,0 +1,2 @@
+three
+=====
diff --git a/two.markdown b/two.md
similarity index 50%
rename from two.markdown
rename to two.md
index f719efd..6a268ed 100644
--- a/two.markdown
+++ b/two.md
@@ -1 +1,2 @@
 two
+===
--
2.14.1
DIFF

    assert_equal 2, diff.size
    assert_equal "three.md", diff[0].file_name
    assert_nil               diff[0].previous_file_name

    assert_equal "two.md",       diff[1].file_name
    assert_equal "two.markdown", diff[1].previous_file_name
  end
