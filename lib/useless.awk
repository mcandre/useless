@include "join"

match($0, /^.+\:.*\:.*\:.*$/) {
  split($0, parts, ":");

  if (parts[1] == ENVIRON["GROUP"]) {
    split(parts[4], groups, ",")
    groups[length(groups)+1] = ENVIRON["USERNAME"]

    printf("%s:%s:%s:%s\n", parts[1], parts[2], parts[3], join(groups, 1, length(groups), ","))
  }
  else {
    print
  }
}
