class GitHubCommit {
  final String url;
  final String sha;
  final String nodeId;
  final String htmlUrl;
  final String commentsUrl;
  final Commit commit;
  final GitHubCommitAuthor? author;
  final GitHubCommitAuthor? committer;
  final List<Tree> parents;

  GitHubCommit({
    required this.url,
    required this.sha,
    required this.nodeId,
    required this.htmlUrl,
    required this.commentsUrl,
    required this.commit,
    required this.author,
    required this.committer,
    required this.parents,
  });

  factory GitHubCommit.fromJson(Map<String, dynamic> json) => GitHubCommit(
        url: json["url"],
        sha: json["sha"],
        nodeId: json["node_id"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        commit: Commit.fromJson(json["commit"]),
        author: json["author"] == null
            ? null
            : GitHubCommitAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : GitHubCommitAuthor.fromJson(json["committer"]),
        parents: List<Tree>.from(json["parents"].map((x) => Tree.fromJson(x))),
      );
}

class GitHubCommitAuthor {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  GitHubCommitAuthor({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory GitHubCommitAuthor.fromJson(Map<String, dynamic> json) =>
      GitHubCommitAuthor(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );
}

class Commit {
  final String url;
  final CommitAuthor author;
  final CommitAuthor committer;
  final String message;
  final Tree tree;
  final int commentCount;
  final Verification verification;

  Commit({
    required this.url,
    required this.author,
    required this.committer,
    required this.message,
    required this.tree,
    required this.commentCount,
    required this.verification,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        url: json["url"],
        author: CommitAuthor.fromJson(json["author"]),
        committer: CommitAuthor.fromJson(json["committer"]),
        message: json["message"],
        tree: Tree.fromJson(json["tree"]),
        commentCount: json["comment_count"],
        verification: Verification.fromJson(json["verification"]),
      );
}

class CommitAuthor {
  final String name;
  final String email;
  final DateTime date;

  CommitAuthor({
    required this.name,
    required this.email,
    required this.date,
  });

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );
}

class Tree {
  final String url;
  final String sha;

  Tree({
    required this.url,
    required this.sha,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        url: json["url"],
        sha: json["sha"],
      );
}

class Verification {
  final bool verified;
  final String reason;
  final dynamic signature;
  final dynamic payload;

  Verification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );
}
