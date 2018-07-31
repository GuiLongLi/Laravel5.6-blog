/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : laravel

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-07-31 09:24:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog_comments_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_comments_article`;
CREATE TABLE `blog_comments_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_article_user_id_index` (`user_id`),
  KEY `comments_article_post_id_index` (`post_id`),
  KEY `comments_article_parent_id_index` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog_comments_article
-- ----------------------------
INSERT INTO `blog_comments_article` VALUES ('1', '1', '5', '5', '阿尔法而非', '2018-07-30 11:39:59', '2018-07-30 11:39:59');
INSERT INTO `blog_comments_article` VALUES ('2', '1', '5', '1', 'aefawef', '2018-07-30 14:53:01', '2018-07-30 14:53:01');
INSERT INTO `blog_comments_article` VALUES ('3', '1', '5', '5', '“安慰法”', '2018-07-30 15:53:42', '2018-07-30 15:53:42');
INSERT INTO `blog_comments_article` VALUES ('4', '1', '5', '2', '盖楼', '2018-07-30 16:06:03', '2018-07-30 16:06:03');

-- ----------------------------
-- Table structure for blog_jobs
-- ----------------------------
DROP TABLE IF EXISTS `blog_jobs`;
CREATE TABLE `blog_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`(250))
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for blog_migrations
-- ----------------------------
DROP TABLE IF EXISTS `blog_migrations`;
CREATE TABLE `blog_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog_migrations
-- ----------------------------
INSERT INTO `blog_migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `blog_migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `blog_migrations` VALUES ('3', '2018_07_20_015018_create_posts_table', '1');
INSERT INTO `blog_migrations` VALUES ('4', '2018_07_24_093923_create_tags_table', '2');
INSERT INTO `blog_migrations` VALUES ('5', '2018_07_24_094004_create_post_tagag_pivot', '2');
INSERT INTO `blog_migrations` VALUES ('6', '2018_07_25_142203_restructure_posts_table', '3');
INSERT INTO `blog_migrations` VALUES ('7', '2018_07_28_101822_create_jobs_table', '4');
INSERT INTO `blog_migrations` VALUES ('8', '2018_07_30_085956_comments_article', '5');
INSERT INTO `blog_migrations` VALUES ('9', '2018_07_30_094903_comments_article', '6');

-- ----------------------------
-- Table structure for blog_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `blog_password_resets`;
CREATE TABLE `blog_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for blog_post_tag_pivot
-- ----------------------------
DROP TABLE IF EXISTS `blog_post_tag_pivot`;
CREATE TABLE `blog_post_tag_pivot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_tag_pivot_post_id_index` (`post_id`),
  KEY `post_tag_pivot_tag_id_index` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog_post_tag_pivot
-- ----------------------------
INSERT INTO `blog_post_tag_pivot` VALUES ('1', '1', '2', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('2', '2', '2', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('3', '3', '3', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('4', '3', '4', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('5', '4', '5', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('6', '5', '2', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('7', '6', '1', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('8', '7', '3', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('9', '8', '3', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('10', '9', '3', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('11', '10', '1', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('12', '11', '2', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('13', '11', '5', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('14', '12', '4', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('15', '12', '1', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('16', '13', '3', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('17', '13', '1', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('18', '14', '5', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('19', '15', '2', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('20', '16', '5', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('21', '17', '5', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('22', '18', '3', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('23', '18', '2', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('24', '19', '3', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('25', '20', '2', null, null);
INSERT INTO `blog_post_tag_pivot` VALUES ('26', '20', '1', null, null);

-- ----------------------------
-- Table structure for blog_posts
-- ----------------------------
DROP TABLE IF EXISTS `blog_posts`;
CREATE TABLE `blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_raw` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_draft` tinyint(1) NOT NULL,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blog.layouts.post',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_published_at_index` (`published_at`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog_posts
-- ----------------------------
INSERT INTO `blog_posts` VALUES ('1', 'est-possimus-quia-commodi-aperiam-reprehenderit-omnis-sapiente-quia', 'Est possimus quia commodi aperiam reprehenderit omnis sapiente quia.', 'Maxime nam rem alias deserunt eius alias et dicta voluptatem distinctio voluptas maiores et saepe natus.', 'Aut qui quia aut itaque cum. Exercitationem soluta reprehenderit accusantium aut in voluptatem. Exercitationem illum eveniet quos minus eos. Ut asperiores ea ea sed dicta ullam.\\n\\nPorro doloribus totam tempora magni nam praesentium aut. Voluptatem natus mollitia facilis et. Enim aut totam dicta beatae aut.\\n\\nNumquam vero mollitia inventore consequuntur nihil in. Omnis suscipit laudantium odit nostrum explicabo. Ut voluptatem inventore optio aspernatur quas a aperiam eum. Maxime veniam ut quis.\\n\\nQuam et exercitationem expedita veritatis. Dolor sed sequi non. Ducimus doloremque et ut. Fuga ipsa harum ullam omnis.', '<p>Aut qui quia aut itaque cum. Exercitationem soluta reprehenderit accusantium aut in voluptatem. Exercitationem illum eveniet quos minus eos. Ut asperiores ea ea sed dicta ullam.\\n\\nPorro doloribus totam tempora magni nam praesentium aut. Voluptatem natus mollitia facilis et. Enim aut totam dicta beatae aut.\\n\\nNumquam vero mollitia inventore consequuntur nihil in. Omnis suscipit laudantium odit nostrum explicabo. Ut voluptatem inventore optio aspernatur quas a aperiam eum. Maxime veniam ut quis.\\n\\nQuam et exercitationem expedita veritatis. Dolor sed sequi non. Ducimus doloremque et ut. Fuga ipsa harum ullam omnis.</p>\n', 'contact-bg.jpg', 'Meta for Est possimus quia commodi aperiam reprehenderit omnis sapiente quia.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-06-27 23:09:08');
INSERT INTO `blog_posts` VALUES ('2', 'officiis-dolores-explicabo-eum', 'Officiis dolores explicabo eum.', 'Nihil nihil minima dicta ullam labore rerum ut expedita totam voluptatem tempore sed velit in.', 'Consequuntur voluptatibus voluptas est nam. Illo molestiae consequuntur quos consequuntur architecto molestiae. Ut nihil impedit rem tempora dolorem.\\n\\nMaxime ipsa veritatis deleniti repellat possimus dolor. Atque rerum atque mollitia. Animi ut rem quos ut sit sed. Sequi aut eos aliquid dolorem eos aspernatur sunt voluptatibus.\\n\\nConsequuntur perferendis ut dicta est placeat tempore delectus sint. Fugiat est itaque totam dolore. Magnam quo itaque itaque. Doloribus doloremque laboriosam molestias enim sint.', '<p>Consequuntur voluptatibus voluptas est nam. Illo molestiae consequuntur quos consequuntur architecto molestiae. Ut nihil impedit rem tempora dolorem.\\n\\nMaxime ipsa veritatis deleniti repellat possimus dolor. Atque rerum atque mollitia. Animi ut rem quos ut sit sed. Sequi aut eos aliquid dolorem eos aspernatur sunt voluptatibus.\\n\\nConsequuntur perferendis ut dicta est placeat tempore delectus sint. Fugiat est itaque totam dolore. Magnam quo itaque itaque. Doloribus doloremque laboriosam molestias enim sint.</p>\n', 'contact-bg.jpg', 'Meta for Officiis dolores explicabo eum.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-14 11:15:15');
INSERT INTO `blog_posts` VALUES ('3', 'voluptatem-similique-quasi-officiis-dolores-suscipit-placeat-quaerat-facilis-saepe', 'Voluptatem similique quasi officiis dolores suscipit placeat quaerat facilis saepe.', 'Accusamus veniam sequi modi sed qui dolore harum repellendus autem et consequatur.', 'Corporis officiis aliquam fugiat deserunt. Dolor et nesciunt doloribus voluptate.\\n\\nMaiores quasi odio aut. Sed aut doloribus libero et omnis autem est aut. Quis praesentium dolorum quas voluptatem.\\n\\nNobis iusto dolorem reprehenderit culpa et. Ea ut aut recusandae vel.\\n\\nConsectetur voluptatem id autem. Harum nulla esse debitis eveniet quos doloremque. Voluptatum occaecati deserunt quia ipsam rerum nemo quia.', '<p>Corporis officiis aliquam fugiat deserunt. Dolor et nesciunt doloribus voluptate.\\n\\nMaiores quasi odio aut. Sed aut doloribus libero et omnis autem est aut. Quis praesentium dolorum quas voluptatem.\\n\\nNobis iusto dolorem reprehenderit culpa et. Ea ut aut recusandae vel.\\n\\nConsectetur voluptatem id autem. Harum nulla esse debitis eveniet quos doloremque. Voluptatum occaecati deserunt quia ipsam rerum nemo quia.</p>\n', 'home-bg.jpg', 'Meta for Voluptatem similique quasi officiis dolores suscipit placeat quaerat facilis saepe.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-23 19:16:26');
INSERT INTO `blog_posts` VALUES ('4', 'dolorum-quo-enim-et-ipsum-illo-iste-ullam-molestiae-recusandae-modi', 'Dolorum quo enim et ipsum illo iste ullam molestiae recusandae modi.', 'Tempore nihil sunt distinctio neque natus qui itaque dolore dicta iure quaerat qui explicabo est ea sunt rerum quod et voluptates.', 'Odio dolorem molestiae beatae at. Est quos veritatis illum a ab sed. Omnis ut maxime ut repudiandae explicabo facilis ut dolore. Ratione consequatur dicta consequatur accusantium minus voluptatem.\\n\\nPlaceat asperiores quia non voluptas itaque illo ipsum debitis. Doloremque quod aliquid nobis consequatur velit rerum necessitatibus natus. Non dolorum atque rerum architecto rerum et tempore enim.\\n\\nModi illo dicta sit suscipit. Autem culpa eum eaque aliquam eveniet illo deserunt eligendi. Cumque id molestias natus soluta quibusdam animi at. Ut quos ab vitae ex aut magni.', '<p>Odio dolorem molestiae beatae at. Est quos veritatis illum a ab sed. Omnis ut maxime ut repudiandae explicabo facilis ut dolore. Ratione consequatur dicta consequatur accusantium minus voluptatem.\\n\\nPlaceat asperiores quia non voluptas itaque illo ipsum debitis. Doloremque quod aliquid nobis consequatur velit rerum necessitatibus natus. Non dolorum atque rerum architecto rerum et tempore enim.\\n\\nModi illo dicta sit suscipit. Autem culpa eum eaque aliquam eveniet illo deserunt eligendi. Cumque id molestias natus soluta quibusdam animi at. Ut quos ab vitae ex aut magni.</p>\n', 'post-bg.jpg', 'Meta for Dolorum quo enim et ipsum illo iste ullam molestiae recusandae modi.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-28 18:18:50');
INSERT INTO `blog_posts` VALUES ('5', 'qui-alias-ea-voluptates-nisi-eum', 'Qui alias ea voluptates nisi eum.', 'Optio ad excepturi qui culpa inventore dolore ipsum laboriosam repellat recusandae deleniti ut sequi architecto omnis sit quae aut voluptates sed dolores dolorem.', 'Iste reiciendis laborum laudantium. Et non sit inventore esse dolorem quas molestiae. Quae quo sapiente et corrupti. Eos temporibus est velit sequi excepturi.\\n\\nAd ut explicabo dolores sit rem. Fugit excepturi voluptas quia vel autem omnis labore. Quo iure et dicta et dolorem. Nulla aut magnam possimus excepturi.\\n\\nCupiditate corrupti eos molestiae. Qui quia omnis fugit ipsam fugiat architecto quis omnis. Odit incidunt reiciendis voluptatem ut est. Et et ratione excepturi doloremque eligendi.\\n\\nQuis et sunt consequatur expedita. Commodi eos eum quisquam quaerat et. Asperiores magnam autem nulla amet in.', '<p>Iste reiciendis laborum laudantium. Et non sit inventore esse dolorem quas molestiae. Quae quo sapiente et corrupti. Eos temporibus est velit sequi excepturi.\\n\\nAd ut explicabo dolores sit rem. Fugit excepturi voluptas quia vel autem omnis labore. Quo iure et dicta et dolorem. Nulla aut magnam possimus excepturi.\\n\\nCupiditate corrupti eos molestiae. Qui quia omnis fugit ipsam fugiat architecto quis omnis. Odit incidunt reiciendis voluptatem ut est. Et et ratione excepturi doloremque eligendi.\\n\\nQuis et sunt consequatur expedita. Commodi eos eum quisquam quaerat et. Asperiores magnam autem nulla amet in.</p>\n', 'about-bg.jpg', 'Meta for Qui alias ea voluptates nisi eum.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-23 12:50:42');
INSERT INTO `blog_posts` VALUES ('6', 'et-quis-eos-natus-tempore', 'Et quis eos natus tempore.', 'Commodi vero nulla fuga mollitia sequi vitae quam rerum minima ipsam sequi voluptate.', 'Dolor pariatur quod eius animi rerum exercitationem voluptas. Perferendis molestiae excepturi qui molestias nulla. Quis ratione voluptates est et minima vel iure. In facilis fuga laborum ut. Debitis totam voluptas et nostrum quia magni.\\n\\nSint autem facere odio aspernatur facere dolore. Temporibus vero dignissimos consectetur accusamus. Occaecati et non placeat velit aut non qui.\\n\\nAmet eveniet incidunt perferendis nam quos. Voluptatem numquam ad quo.\\n\\nLabore officia eos est porro. Autem quam cumque quia vel. Nihil provident voluptas impedit autem.', '<p>Dolor pariatur quod eius animi rerum exercitationem voluptas. Perferendis molestiae excepturi qui molestias nulla. Quis ratione voluptates est et minima vel iure. In facilis fuga laborum ut. Debitis totam voluptas et nostrum quia magni.\\n\\nSint autem facere odio aspernatur facere dolore. Temporibus vero dignissimos consectetur accusamus. Occaecati et non placeat velit aut non qui.\\n\\nAmet eveniet incidunt perferendis nam quos. Voluptatem numquam ad quo.\\n\\nLabore officia eos est porro. Autem quam cumque quia vel. Nihil provident voluptas impedit autem.</p>\n', 'contact-bg.jpg', 'Meta for Et quis eos natus tempore.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-17 06:27:24');
INSERT INTO `blog_posts` VALUES ('7', 'veniam-eos-vel-perspiciatis-facere-ea', 'Veniam eos vel perspiciatis facere ea.', 'Quo eius ipsum magni consequatur quia est quia fuga dolores aperiam nesciunt qui et odio tempore est illo veritatis ut provident facere occaecati voluptatem ea dolore.', 'Et quis omnis in itaque asperiores non odit. Exercitationem tenetur eum omnis.\\n\\nUnde eaque iusto omnis quibusdam dicta. Sequi numquam id nostrum ratione. Autem totam quae inventore voluptatem.\\n\\nExcepturi id error consequatur quo voluptas harum quia. Ipsa dicta dolorum voluptatem. Aut autem laboriosam consequatur dolorem.\\n\\nDolores quia et voluptatibus vel rem. Assumenda rerum dolorem et occaecati nostrum. Est facere voluptate et aut vel ratione est. Assumenda non voluptatem aspernatur tempore voluptatem aut.\\n\\nProvident molestiae inventore odio aut. Mollitia unde non saepe hic iusto consequuntur. Et hic laborum aut molestias sit nihil. Sed perspiciatis iusto minus dolore.', '<p>Et quis omnis in itaque asperiores non odit. Exercitationem tenetur eum omnis.\\n\\nUnde eaque iusto omnis quibusdam dicta. Sequi numquam id nostrum ratione. Autem totam quae inventore voluptatem.\\n\\nExcepturi id error consequatur quo voluptas harum quia. Ipsa dicta dolorum voluptatem. Aut autem laboriosam consequatur dolorem.\\n\\nDolores quia et voluptatibus vel rem. Assumenda rerum dolorem et occaecati nostrum. Est facere voluptate et aut vel ratione est. Assumenda non voluptatem aspernatur tempore voluptatem aut.\\n\\nProvident molestiae inventore odio aut. Mollitia unde non saepe hic iusto consequuntur. Et hic laborum aut molestias sit nihil. Sed perspiciatis iusto minus dolore.</p>\n', 'about-bg.jpg', 'Meta for Veniam eos vel perspiciatis facere ea.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-06 15:30:23');
INSERT INTO `blog_posts` VALUES ('8', 'incidunt-qui-rerum-ut-voluptas-et-aut-eos', 'Incidunt qui rerum ut voluptas et aut eos.', 'Repellat adipisci eius officiis architecto ut facere velit rerum sunt odio velit earum rerum animi.', 'Quo ut sed qui dolorem. Autem inventore incidunt dolore dolores asperiores. Sed labore modi eum qui. Sint eos excepturi cumque.\\n\\nQuisquam ut ut magnam architecto reprehenderit reiciendis in minus. Aliquid illo ea a. Porro quia pariatur distinctio repellat sint et. Vel quis est esse iure culpa id.\\n\\nCommodi nulla qui totam minus non. Corporis omnis velit dolor debitis. Earum atque sed sed accusamus ad.\\n\\nMagnam sunt voluptate est totam perferendis. Quia pariatur aut ducimus ea modi odio amet. Rerum ab et odio laborum est hic laudantium.\\n\\nDolor maxime consectetur explicabo libero sapiente repellendus. Adipisci sit quis odio. Nisi repellat occaecati suscipit officia a illum.\\n\\nVoluptatibus molestiae tempore repellat et. Sunt consequatur tempora qui a. In eaque est dolores laborum tenetur eos consequatur voluptate. Ut maxime qui quaerat qui velit est.', '<p>Quo ut sed qui dolorem. Autem inventore incidunt dolore dolores asperiores. Sed labore modi eum qui. Sint eos excepturi cumque.\\n\\nQuisquam ut ut magnam architecto reprehenderit reiciendis in minus. Aliquid illo ea a. Porro quia pariatur distinctio repellat sint et. Vel quis est esse iure culpa id.\\n\\nCommodi nulla qui totam minus non. Corporis omnis velit dolor debitis. Earum atque sed sed accusamus ad.\\n\\nMagnam sunt voluptate est totam perferendis. Quia pariatur aut ducimus ea modi odio amet. Rerum ab et odio laborum est hic laudantium.\\n\\nDolor maxime consectetur explicabo libero sapiente repellendus. Adipisci sit quis odio. Nisi repellat occaecati suscipit officia a illum.\\n\\nVoluptatibus molestiae tempore repellat et. Sunt consequatur tempora qui a. In eaque est dolores laborum tenetur eos consequatur voluptate. Ut maxime qui quaerat qui velit est.</p>\n', 'about-bg.jpg', 'Meta for Incidunt qui rerum ut voluptas et aut eos.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-11 07:46:03');
INSERT INTO `blog_posts` VALUES ('9', 'illo-eos-minima', 'Illo eos minima.', 'Distinctio rem laudantium aut architecto quis dolores ex enim nisi expedita ab libero commodi eius.', 'Voluptas quae atque est et quis tempora est. Repellat saepe laudantium soluta autem quibusdam et et. At reiciendis sed eius id atque ut quibusdam. Quos quasi quae consequatur qui.\\n\\nOccaecati ad optio ut rerum a autem. Ut similique quia nihil repudiandae id. Quo magnam necessitatibus cupiditate aut. Harum quis dolor qui et eos magnam et. Omnis ducimus voluptatum asperiores cum hic amet.\\n\\nDolorem ducimus velit in a eos magnam aut repellendus. Assumenda in fugit dolores. Quam unde mollitia doloremque sit inventore iste nulla. Quisquam cupiditate et impedit laboriosam.\\n\\nLaudantium aut atque error cum. Qui consequuntur ut suscipit magni quas consequatur. Error sit nisi assumenda vel animi id. Sint enim illo numquam.\\n\\nModi sit odit consequatur nemo nam. Commodi vitae ipsa officiis quia commodi quis sit. Ex officia doloremque porro non laboriosam et nihil. Ut dicta exercitationem est repudiandae quos dolore ea qui.', '<p>Voluptas quae atque est et quis tempora est. Repellat saepe laudantium soluta autem quibusdam et et. At reiciendis sed eius id atque ut quibusdam. Quos quasi quae consequatur qui.\\n\\nOccaecati ad optio ut rerum a autem. Ut similique quia nihil repudiandae id. Quo magnam necessitatibus cupiditate aut. Harum quis dolor qui et eos magnam et. Omnis ducimus voluptatum asperiores cum hic amet.\\n\\nDolorem ducimus velit in a eos magnam aut repellendus. Assumenda in fugit dolores. Quam unde mollitia doloremque sit inventore iste nulla. Quisquam cupiditate et impedit laboriosam.\\n\\nLaudantium aut atque error cum. Qui consequuntur ut suscipit magni quas consequatur. Error sit nisi assumenda vel animi id. Sint enim illo numquam.\\n\\nModi sit odit consequatur nemo nam. Commodi vitae ipsa officiis quia commodi quis sit. Ex officia doloremque porro non laboriosam et nihil. Ut dicta exercitationem est repudiandae quos dolore ea qui.</p>\n', 'post-bg.jpg', 'Meta for Illo eos minima.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-11 14:30:31');
INSERT INTO `blog_posts` VALUES ('10', 'aut-voluptatem-dicta-reprehenderit-ex-ea-est-placeat', 'Aut voluptatem dicta reprehenderit ex ea est placeat.', 'Quia enim quisquam non qui sit libero iure in fugiat iste eos minima necessitatibus odio quisquam rerum deserunt nisi repellat earum sed.', 'Cum qui cupiditate explicabo voluptatem. Dignissimos et nisi suscipit reprehenderit mollitia qui quas. Quo qui omnis alias quo sequi.\\n\\nVeniam qui eligendi voluptatem doloribus eos vel. Velit sit deleniti et. Ducimus aperiam rerum expedita sunt dolorem temporibus culpa nam. Quaerat ab dolorum corrupti eos.\\n\\nAssumenda quod consequatur laboriosam aperiam sit. Rem aut ad autem quos. Provident labore repellat laudantium voluptates quibusdam ipsa dolores. Deserunt ut neque magni nihil iure necessitatibus.\\n\\nSed earum molestiae nesciunt sint. Maxime eum vitae dolor fugit optio et laboriosam quia. Hic laudantium dolor aut vel. Distinctio vitae et ea voluptates. Est fugiat et iste id rerum.', '<p>Cum qui cupiditate explicabo voluptatem. Dignissimos et nisi suscipit reprehenderit mollitia qui quas. Quo qui omnis alias quo sequi.\\n\\nVeniam qui eligendi voluptatem doloribus eos vel. Velit sit deleniti et. Ducimus aperiam rerum expedita sunt dolorem temporibus culpa nam. Quaerat ab dolorum corrupti eos.\\n\\nAssumenda quod consequatur laboriosam aperiam sit. Rem aut ad autem quos. Provident labore repellat laudantium voluptates quibusdam ipsa dolores. Deserunt ut neque magni nihil iure necessitatibus.\\n\\nSed earum molestiae nesciunt sint. Maxime eum vitae dolor fugit optio et laboriosam quia. Hic laudantium dolor aut vel. Distinctio vitae et ea voluptates. Est fugiat et iste id rerum.</p>\n', 'contact-bg.jpg', 'Meta for Aut voluptatem dicta reprehenderit ex ea est placeat.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-10 06:21:00');
INSERT INTO `blog_posts` VALUES ('11', 'ut-dolore-delectus-corrupti', 'Ut dolore delectus corrupti.', 'Alias repudiandae occaecati fugiat et ea voluptate dolorem aliquid ratione.', 'Et nisi voluptatibus ea dolorem. Impedit distinctio voluptatem qui nihil. Culpa et accusantium et eos.\\n\\nBeatae magni consectetur veritatis sed. Qui vitae quaerat voluptatum impedit. Corporis quidem quis iste numquam ut consequatur pariatur. Consectetur inventore voluptatem molestiae. Natus iste molestias impedit ipsa dignissimos.\\n\\nSit sapiente voluptatem quasi voluptatum maxime. Optio quibusdam quis quia. Voluptas id voluptatem omnis nostrum mollitia hic.\\n\\nAsperiores molestiae quia architecto dolore magni animi. Rerum sit eius minima. Sed voluptatum similique dolorem occaecati qui.', '<p>Et nisi voluptatibus ea dolorem. Impedit distinctio voluptatem qui nihil. Culpa et accusantium et eos.\\n\\nBeatae magni consectetur veritatis sed. Qui vitae quaerat voluptatum impedit. Corporis quidem quis iste numquam ut consequatur pariatur. Consectetur inventore voluptatem molestiae. Natus iste molestias impedit ipsa dignissimos.\\n\\nSit sapiente voluptatem quasi voluptatum maxime. Optio quibusdam quis quia. Voluptas id voluptatem omnis nostrum mollitia hic.\\n\\nAsperiores molestiae quia architecto dolore magni animi. Rerum sit eius minima. Sed voluptatum similique dolorem occaecati qui.</p>\n', 'about-bg.jpg', 'Meta for Ut dolore delectus corrupti.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-21 02:06:50');
INSERT INTO `blog_posts` VALUES ('12', 'velit-illo-nulla-rerum-aspernatur-ratione-quos-fugiat', 'Velit illo nulla rerum aspernatur ratione quos fugiat.', 'In iure eos et commodi corporis tempore voluptas dolores ea minima neque qui.', 'Mollitia sunt dolores et cupiditate assumenda voluptatem et. Excepturi culpa dolores praesentium repudiandae. Quo similique laboriosam quos ut.\\n\\nConsequatur et temporibus totam aut a quod. Dolores ratione autem ratione aut saepe magni. Omnis culpa deserunt ex. Eum ducimus numquam quia distinctio omnis autem.\\n\\nInventore ut enim ut culpa doloribus. Minus et numquam dolores et modi dolor. Expedita voluptas et et. Consequatur et ut sunt unde.', '<p>Mollitia sunt dolores et cupiditate assumenda voluptatem et. Excepturi culpa dolores praesentium repudiandae. Quo similique laboriosam quos ut.\\n\\nConsequatur et temporibus totam aut a quod. Dolores ratione autem ratione aut saepe magni. Omnis culpa deserunt ex. Eum ducimus numquam quia distinctio omnis autem.\\n\\nInventore ut enim ut culpa doloribus. Minus et numquam dolores et modi dolor. Expedita voluptas et et. Consequatur et ut sunt unde.</p>\n', 'post-bg.jpg', 'Meta for Velit illo nulla rerum aspernatur ratione quos fugiat.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-25 23:19:52');
INSERT INTO `blog_posts` VALUES ('13', 'non-quod-fuga-iure-corporis-ipsa-enim-et-nostrum', 'Non quod fuga iure corporis ipsa enim et nostrum.', 'Voluptates sunt aut atque repellendus inventore ut maxime quasi earum consequuntur velit ut ut et saepe.', 'Quibusdam hic iure enim non enim omnis. Cumque sit officiis reiciendis et autem blanditiis ut et.\\n\\nNon dolores enim voluptatem nihil omnis. Facere aut doloremque eum nobis. Dolore aliquam cupiditate mollitia velit voluptatem. Temporibus qui facere quae non.\\n\\nQuaerat ut nam qui voluptatibus. Enim facere harum sint tempore fugit impedit. Magnam animi sit aut itaque possimus voluptates dolorum nihil.\\n\\nDolore autem omnis officia qui est repellat ratione. Sit explicabo incidunt rem pariatur harum eius voluptate excepturi. Est nulla possimus iusto a culpa ut.\\n\\nDignissimos numquam qui cumque esse repellat amet cum quae. Qui unde non tenetur non assumenda. Consectetur reiciendis nostrum est et. Vero at non illo quaerat.\\n\\nAd magnam id qui earum ab. Quis earum et iste est rerum facilis.', '<p>Quibusdam hic iure enim non enim omnis. Cumque sit officiis reiciendis et autem blanditiis ut et.\\n\\nNon dolores enim voluptatem nihil omnis. Facere aut doloremque eum nobis. Dolore aliquam cupiditate mollitia velit voluptatem. Temporibus qui facere quae non.\\n\\nQuaerat ut nam qui voluptatibus. Enim facere harum sint tempore fugit impedit. Magnam animi sit aut itaque possimus voluptates dolorum nihil.\\n\\nDolore autem omnis officia qui est repellat ratione. Sit explicabo incidunt rem pariatur harum eius voluptate excepturi. Est nulla possimus iusto a culpa ut.\\n\\nDignissimos numquam qui cumque esse repellat amet cum quae. Qui unde non tenetur non assumenda. Consectetur reiciendis nostrum est et. Vero at non illo quaerat.\\n\\nAd magnam id qui earum ab. Quis earum et iste est rerum facilis.</p>\n', 'about-bg.jpg', 'Meta for Non quod fuga iure corporis ipsa enim et nostrum.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-21 00:54:29');
INSERT INTO `blog_posts` VALUES ('14', 'aliquam-adipisci-consectetur', 'Aliquam adipisci consectetur.', 'Consequatur doloribus nihil illo nam veritatis sapiente ad excepturi quod quibusdam aut dicta omnis qui eius rerum.', 'Accusamus illo dolor sunt est. Sequi consectetur maiores error hic quis. Commodi iusto quaerat voluptas omnis.\\n\\nVeniam sequi neque inventore totam culpa rerum aspernatur. Velit ut rerum delectus quibusdam sit. Placeat dolor vitae libero sint. Ab est et tempora deserunt optio.\\n\\nUt sit eligendi consectetur aut provident quibusdam sint. Magnam tenetur ab earum veniam ad dolorum nisi. Odit earum modi exercitationem aut.', '<p>Accusamus illo dolor sunt est. Sequi consectetur maiores error hic quis. Commodi iusto quaerat voluptas omnis.\\n\\nVeniam sequi neque inventore totam culpa rerum aspernatur. Velit ut rerum delectus quibusdam sit. Placeat dolor vitae libero sint. Ab est et tempora deserunt optio.\\n\\nUt sit eligendi consectetur aut provident quibusdam sint. Magnam tenetur ab earum veniam ad dolorum nisi. Odit earum modi exercitationem aut.</p>\n', 'home-bg.jpg', 'Meta for Aliquam adipisci consectetur.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-09 03:13:10');
INSERT INTO `blog_posts` VALUES ('15', 'autem-ad-facere-ut-ratione-molestiae', 'Autem ad facere ut ratione molestiae.', 'Dolorem ut quibusdam et quod ipsum et sit nihil modi ut consequuntur debitis excepturi qui ea et alias ipsam accusantium minus dolores.', 'Odit est quia quia dolorum tenetur. Amet laboriosam dolorem molestiae repellat eligendi autem omnis atque. Expedita fugiat enim accusamus similique. Ab aspernatur occaecati ea.\\n\\nVoluptatem illo velit repudiandae ipsam alias eos. Neque rem dicta dolor corporis mollitia quo qui. Occaecati consectetur rem fugiat numquam. Sunt vero magnam ut ut et sed.\\n\\nExplicabo cum consequuntur perferendis libero magni autem sequi. Est consectetur commodi maxime perspiciatis. Voluptas ut amet dolores tempora. Perferendis iusto ad ducimus deserunt possimus dolores sint. Iure nihil voluptatibus voluptatibus necessitatibus.', '<p>Odit est quia quia dolorum tenetur. Amet laboriosam dolorem molestiae repellat eligendi autem omnis atque. Expedita fugiat enim accusamus similique. Ab aspernatur occaecati ea.\\n\\nVoluptatem illo velit repudiandae ipsam alias eos. Neque rem dicta dolor corporis mollitia quo qui. Occaecati consectetur rem fugiat numquam. Sunt vero magnam ut ut et sed.\\n\\nExplicabo cum consequuntur perferendis libero magni autem sequi. Est consectetur commodi maxime perspiciatis. Voluptas ut amet dolores tempora. Perferendis iusto ad ducimus deserunt possimus dolores sint. Iure nihil voluptatibus voluptatibus necessitatibus.</p>\n', 'about-bg.jpg', 'Meta for Autem ad facere ut ratione molestiae.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-06 18:34:18');
INSERT INTO `blog_posts` VALUES ('16', 'quas-expedita-soluta-amet-optio-molestiae-veniam', 'Quas expedita soluta amet optio molestiae veniam.', 'Architecto laboriosam rerum velit ipsum veniam soluta nihil sit quam et autem omnis similique.', 'Qui perspiciatis in odit velit. Aliquid est neque hic dolore ut magni dignissimos. Itaque iure tempora non eveniet numquam quidem. Occaecati numquam possimus iusto aperiam consectetur eum ut.\\n\\nEst iusto soluta inventore. Omnis delectus sint reprehenderit hic et temporibus sit. Molestiae accusantium voluptatum quis ad.\\n\\nOfficia ut quasi voluptas. Ut cum adipisci nisi et aliquam hic. Consequuntur culpa nobis incidunt repellendus asperiores. Consequatur eum provident qui similique quaerat.\\n\\nRepellat natus excepturi inventore. Reprehenderit nihil ut ut eum molestiae eius. Et ullam qui commodi ducimus consectetur. Sunt quis qui et.\\n\\nFacilis autem et cumque cupiditate cupiditate sit repudiandae. Qui quam et sed rerum repellendus. Perspiciatis eum occaecati magnam dolores perferendis veniam. Debitis eligendi quo sapiente nam ab sunt.', '<p>Qui perspiciatis in odit velit. Aliquid est neque hic dolore ut magni dignissimos. Itaque iure tempora non eveniet numquam quidem. Occaecati numquam possimus iusto aperiam consectetur eum ut.\\n\\nEst iusto soluta inventore. Omnis delectus sint reprehenderit hic et temporibus sit. Molestiae accusantium voluptatum quis ad.\\n\\nOfficia ut quasi voluptas. Ut cum adipisci nisi et aliquam hic. Consequuntur culpa nobis incidunt repellendus asperiores. Consequatur eum provident qui similique quaerat.\\n\\nRepellat natus excepturi inventore. Reprehenderit nihil ut ut eum molestiae eius. Et ullam qui commodi ducimus consectetur. Sunt quis qui et.\\n\\nFacilis autem et cumque cupiditate cupiditate sit repudiandae. Qui quam et sed rerum repellendus. Perspiciatis eum occaecati magnam dolores perferendis veniam. Debitis eligendi quo sapiente nam ab sunt.</p>\n', 'post-bg.jpg', 'Meta for Quas expedita soluta amet optio molestiae veniam.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-09 21:34:37');
INSERT INTO `blog_posts` VALUES ('17', 'praesentium-enim-ab-voluptatem-id-aut-itaque', 'Praesentium enim ab voluptatem id aut itaque.', 'Natus quia nulla fuga voluptas illum exercitationem occaecati cum quaerat at laboriosam quas.', 'Voluptatem a corrupti sed voluptatem laudantium voluptas ut. Vero quas quis voluptatibus aliquam. Unde vel a nulla eligendi.\\n\\nAdipisci quisquam nemo rerum velit. Aperiam aliquid tempore deleniti laborum qui.\\n\\nOmnis vitae ea quia fuga sapiente consequatur. Asperiores voluptas veniam maiores.\\n\\nQuibusdam sequi voluptatibus ipsa quisquam est non. Aliquam quam quam molestias ex dignissimos. Natus ut labore est iste nihil autem excepturi.', '<p>Voluptatem a corrupti sed voluptatem laudantium voluptas ut. Vero quas quis voluptatibus aliquam. Unde vel a nulla eligendi.\\n\\nAdipisci quisquam nemo rerum velit. Aperiam aliquid tempore deleniti laborum qui.\\n\\nOmnis vitae ea quia fuga sapiente consequatur. Asperiores voluptas veniam maiores.\\n\\nQuibusdam sequi voluptatibus ipsa quisquam est non. Aliquam quam quam molestias ex dignissimos. Natus ut labore est iste nihil autem excepturi.</p>\n', 'about-bg.jpg', 'Meta for Praesentium enim ab voluptatem id aut itaque.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-02 20:33:18');
INSERT INTO `blog_posts` VALUES ('18', 'et-placeat-omnis', 'Et placeat omnis.', 'Qui recusandae quia hic rerum nam velit quis rerum eius nihil.', 'Quos dicta officia et saepe perspiciatis culpa. Repudiandae et magnam nihil quis. Qui nisi adipisci et.\\n\\nQui aperiam vel incidunt commodi aspernatur. Aut corporis delectus eveniet optio quod rem ex ullam. Reiciendis repellat impedit commodi occaecati voluptatum. Debitis ducimus blanditiis enim dolore eos.\\n\\nEt labore qui sequi illo minus fugiat soluta nihil. Laudantium molestiae id voluptates deserunt nisi dolore eum quae. Harum est fugiat ratione tempore voluptatem in. Labore repudiandae deserunt sequi et fugiat.\\n\\nAd dolorum pariatur earum quibusdam est sed. Ratione eius iste occaecati voluptas temporibus ut. Excepturi ipsam dicta dolorem. At veritatis magnam ex sunt dignissimos asperiores.\\n\\nNam recusandae eius voluptatum. In saepe non illum corporis ab eveniet aut aut. Quibusdam voluptas ipsam qui et. Est et ea molestiae exercitationem dolores earum aut.', '<p>Quos dicta officia et saepe perspiciatis culpa. Repudiandae et magnam nihil quis. Qui nisi adipisci et.\\n\\nQui aperiam vel incidunt commodi aspernatur. Aut corporis delectus eveniet optio quod rem ex ullam. Reiciendis repellat impedit commodi occaecati voluptatum. Debitis ducimus blanditiis enim dolore eos.\\n\\nEt labore qui sequi illo minus fugiat soluta nihil. Laudantium molestiae id voluptates deserunt nisi dolore eum quae. Harum est fugiat ratione tempore voluptatem in. Labore repudiandae deserunt sequi et fugiat.\\n\\nAd dolorum pariatur earum quibusdam est sed. Ratione eius iste occaecati voluptas temporibus ut. Excepturi ipsam dicta dolorem. At veritatis magnam ex sunt dignissimos asperiores.\\n\\nNam recusandae eius voluptatum. In saepe non illum corporis ab eveniet aut aut. Quibusdam voluptas ipsam qui et. Est et ea molestiae exercitationem dolores earum aut.</p>\n', 'contact-bg.jpg', 'Meta for Et placeat omnis.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-22 22:08:11');
INSERT INTO `blog_posts` VALUES ('19', 'numquam-architecto-quam-necessitatibus-enim-eos-fugit', 'Numquam architecto quam necessitatibus enim eos fugit.', 'Et numquam sint ad veniam eius aliquam ipsum consequatur et voluptate vero praesentium sed libero omnis alias est est pariatur eveniet itaque sit.', 'Est beatae sed adipisci repellat fuga possimus. Rerum ullam itaque itaque sed dolores. Earum sed eum odit aut amet a. Quo quia voluptas in quia voluptatibus tenetur.\\n\\nPraesentium itaque minus illum modi accusantium amet aut. Sunt voluptas deserunt et veniam non laudantium. Qui dignissimos est qui quas quia dolor.\\n\\nExpedita omnis culpa aspernatur quae suscipit totam. Ipsum est dolorem rerum nobis consequatur. Id maiores dolores dolore. Et eligendi nulla repudiandae deserunt aut asperiores animi.\\n\\nNihil saepe quasi omnis suscipit itaque. Dolor quod in aut. Impedit vel illo eveniet voluptatem molestias expedita velit.', '<p>Est beatae sed adipisci repellat fuga possimus. Rerum ullam itaque itaque sed dolores. Earum sed eum odit aut amet a. Quo quia voluptas in quia voluptatibus tenetur.\\n\\nPraesentium itaque minus illum modi accusantium amet aut. Sunt voluptas deserunt et veniam non laudantium. Qui dignissimos est qui quas quia dolor.\\n\\nExpedita omnis culpa aspernatur quae suscipit totam. Ipsum est dolorem rerum nobis consequatur. Id maiores dolores dolore. Et eligendi nulla repudiandae deserunt aut asperiores animi.\\n\\nNihil saepe quasi omnis suscipit itaque. Dolor quod in aut. Impedit vel illo eveniet voluptatem molestias expedita velit.</p>\n', 'post-bg.jpg', 'Meta for Numquam architecto quam necessitatibus enim eos fugit.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-21 15:09:22');
INSERT INTO `blog_posts` VALUES ('20', 'dolores-delectus-mollitia-earum-qui-iste', 'Dolores delectus mollitia earum qui iste.', 'Nisi praesentium doloribus commodi et doloribus ipsa et aut sunt vitae dolorem ut.', 'Consectetur vitae eum et illo voluptatibus sed. Amet suscipit qui sit nostrum. Aut nobis quia voluptatem blanditiis rerum.\\n\\nQuia nam perspiciatis illo qui nihil labore earum. Tempora inventore vel unde magnam sit et amet. Voluptatum sunt at suscipit error alias pariatur. Voluptatem totam qui non labore reiciendis temporibus et.\\n\\nAutem est sunt sit eaque explicabo. Deleniti dignissimos possimus ullam suscipit optio. Sint eius reprehenderit fuga voluptatem eos. Deserunt quae eaque eum temporibus maiores. Quisquam minima commodi sint sint enim natus.\\n\\nEnim veniam nisi rerum non. In autem atque dolorum laudantium. Sint et et repellendus.', '<p>Consectetur vitae eum et illo voluptatibus sed. Amet suscipit qui sit nostrum. Aut nobis quia voluptatem blanditiis rerum.\\n\\nQuia nam perspiciatis illo qui nihil labore earum. Tempora inventore vel unde magnam sit et amet. Voluptatum sunt at suscipit error alias pariatur. Voluptatem totam qui non labore reiciendis temporibus et.\\n\\nAutem est sunt sit eaque explicabo. Deleniti dignissimos possimus ullam suscipit optio. Sint eius reprehenderit fuga voluptatem eos. Deserunt quae eaque eum temporibus maiores. Quisquam minima commodi sint sint enim natus.\\n\\nEnim veniam nisi rerum non. In autem atque dolorum laudantium. Sint et et repellendus.</p>\n', 'home-bg.jpg', 'Meta for Dolores delectus mollitia earum qui iste.', '0', 'blog.layouts.post', '2018-07-27 16:06:55', '2018-07-27 16:06:55', '2018-07-03 00:43:22');

-- ----------------------------
-- Table structure for blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签图片',
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标签介绍',
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blog.layouts.index' COMMENT '博客终归要使用布局',
  `reverse_direction` tinyint(1) NOT NULL COMMENT '在文章列表按时间升序排序，默认是见徐',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tag_unique` (`tag`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog_tags
-- ----------------------------
INSERT INTO `blog_tags` VALUES ('1', 'sit', 'Sit', 'Facere atque maiores voluptas.', 'home-bg.jpg', 'Meta for sit', 'blog.layouts.index', '0', '2018-07-27 16:06:55', '2018-07-27 16:06:55');
INSERT INTO `blog_tags` VALUES ('2', 'et', 'Et', 'Ratione facere perspiciatis odit.', 'about-bg.jpg', 'Meta for et', 'blog.layouts.index', '0', '2018-07-27 16:06:55', '2018-07-27 16:06:55');
INSERT INTO `blog_tags` VALUES ('3', 'animi', 'Animi', 'Explicabo adipisci repellendus et.', 'about-bg.jpg', 'Meta for animi', 'blog.layouts.index', '0', '2018-07-27 16:06:55', '2018-07-27 16:06:55');
INSERT INTO `blog_tags` VALUES ('4', 'non', 'Non', 'Quasi est omnis quis deleniti.', 'about-bg.jpg', 'Meta for non', 'blog.layouts.index', '0', '2018-07-27 16:06:55', '2018-07-27 16:06:55');
INSERT INTO `blog_tags` VALUES ('5', 'repellendus', 'Repellendus', 'In voluptatem minus molestias numquam.', 'post-bg.jpg', 'Meta for repellendus', 'blog.layouts.index', '0', '2018-07-27 16:06:55', '2018-07-27 16:06:55');

-- ----------------------------
-- Table structure for blog_users
-- ----------------------------
DROP TABLE IF EXISTS `blog_users`;
CREATE TABLE `blog_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of blog_users
-- ----------------------------
INSERT INTO `blog_users` VALUES ('1', 'admin', '123456@qq.com', '$2y$10$zsLx0BpC4B3oIdSG9Pd1xOjnrWgVPh4C5lU0jSKSOSbYYvG2KV13C', 'K7IZETH8TpnZG17jFehjGjgmaSYG1yRWsFEacFmVSnr2Q3mK4eKfnh7adhdG', '2018-07-23 14:07:08', '2018-07-23 14:07:08');
