# fix the dates and add the three dashes as the first line

#for file in *.md; do awk '{
#  if ($1 == "date:") {
#    printf("%s %sT%s+08:00\n", $1, $2, $3);
#  } else {
#    print $0;
#  }
#}' "$file" > temp.md && mv temp.md $file ; done

for file in *.md; do awk '{
if ($2 == "codeblock") { gsub("lang:", "", $(NF-1));
  printf("%s< highlight %s >}}\n", "{{", $(NF-1));
} else if ($2 == "endcodeblock") {
  printf("%s< /highlight >}}\n", "{{");
} else { print $0; }
}' "$file" > temp.md && mv temp.md $file ; done