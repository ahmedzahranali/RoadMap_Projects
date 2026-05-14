export default function (title: string, id: string) {
  return title
    ? title
        .replace(/[^a-z0-9]/gi, "-")
        .toLowerCase()
        .replace(/-+/g, "-")
        .replace(/^-|-$/g, "")
    : id;
}