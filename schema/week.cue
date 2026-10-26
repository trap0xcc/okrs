package okr

#Entry: {
 status?: "green" | "yellow" | "red" | "completed" | "inactive"
 target?: string | null
 progress?: string
 if status != _|_ {
  if status != "inactive" {target: string | null}
 }
}
#Week: {
 [string]: {
  [string]: {
   [string]: #Entry
  }
 }
}
