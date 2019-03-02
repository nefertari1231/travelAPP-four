/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : four

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 02/03/2019 12:25:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `city_id` int(32) NOT NULL,
  `city_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名字',
  PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, '港澳台');
INSERT INTO `city` VALUES (2, '日本');
INSERT INTO `city` VALUES (3, '韩国');
INSERT INTO `city` VALUES (4, '泰国');
INSERT INTO `city` VALUES (5, '马来西亚');
INSERT INTO `city` VALUES (6, '菲律宾');
INSERT INTO `city` VALUES (7, '印度尼西亚');
INSERT INTO `city` VALUES (8, '法国');

-- ----------------------------
-- Table structure for city_menu
-- ----------------------------
DROP TABLE IF EXISTS `city_menu`;
CREATE TABLE `city_menu`  (
  `cityMenu_id` int(32) NOT NULL AUTO_INCREMENT,
  `cityMenu_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityMenu_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityMenu_bigimg` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityMenu_intro` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_id` int(32) NOT NULL,
  PRIMARY KEY (`cityMenu_id`) USING BTREE,
  INDEX `city_menu_ibfk_1`(`city_id`) USING BTREE,
  CONSTRAINT `city_menu_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1026 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city_menu
-- ----------------------------
INSERT INTO `city_menu` VALUES (1001, '台北', 'https://a3-q.mafengwo.net/s7/M00/0A/ED/wKgB6lQnxZqAfMxIAASBo8KcOEc67.jpeg?imageMogr2%2Fthumbnail%2F%21375x225r%2Fgravity%2FCenter%2Fcrop%2F%21375x225%2Fquality%2F100', 'https://a3-q.mafengwo.net/s7/M00/0A/ED/wKgB6lQnxZqAfMxIAASBo8KcOEc67.jpeg?imageMogr2%2Fthumbnail%2F%21375x225r%2Fgravity%2FCenter%2Fcrop%2F%21375x225%2Fquality%2F100', '台北是一座让人愿意用每一寸脚步去丈量的城市。丰富的人文景观散布市区，厚重的历史沧桑感和浓郁的人文气息让这座城成为文艺青年的必游目的地。此外，市区周边怡人的自然风光让这座城市更具魅力。所以背好行囊，带上相机，出发探索美好的台北吧！', 1);
INSERT INTO `city_menu` VALUES (1002, '香港', 'https://a2-q.mafengwo.net/s5/M00/87/12/wKgB3FGMgSCAZo0qAAgGckFTqJA54.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://a2-q.mafengwo.net/s5/M00/87/12/wKgB3FGMgSCAZo0qAAgGckFTqJA54.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '香港，英文名为Hong Kong。它是一个充满诱惑感的城市，是全球最富裕、经济最发达和生活水平最高的地区之一，是“亚洲四小龙”之一，是国际金融商贸中心之一，是世界大都会之一，然而除了这散发着金钱味道的“第一”后面，香港还150年惊心动魄的巨变，有着中西合璧的丰富文化，有着一颗容纳种族、语言、地域的包容之心。', 1);
INSERT INTO `city_menu` VALUES (1003, '垦丁', 'https://n3-q.mafengwo.net/s9/M00/AB/D1/wKgBs1ZqSM6AaFuuAAR--oh86xY545.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://n3-q.mafengwo.net/s9/M00/AB/D1/wKgBs1ZqSM6AaFuuAAR--oh86xY545.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '垦丁的景点多以自然景观为主，景区之间距离不远，大部分都盘踞在海岸线周边。垦丁狭长的海岸线与独特的海蚀地貌共同构成了当地独一无二的自然景致。', 1);
INSERT INTO `city_menu` VALUES (1004, '东京', 'https://c4-q.mafengwo.net/s8/M00/F2/01/wKgBpVYkXbGAKXrIAAHvh_yTnS807.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://c4-q.mafengwo.net/s8/M00/F2/01/wKgBpVYkXbGAKXrIAAHvh_yTnS807.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '东京拥有复杂的交通网和超大的地理范围，在规划行程时要注意景点之间可能位于不同的区域，需要考虑交通的时间（虽然东京交通超级方便，但是因为太大，所以还是会花费时间）。', 2);
INSERT INTO `city_menu` VALUES (1005, '京都', 'https://c4-q.mafengwo.net/s9/M00/25/35/wKgBs1fNERqAYp3VAB5Ar7kj8KI34.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://c4-q.mafengwo.net/s9/M00/25/35/wKgBs1fNERqAYp3VAB5Ar7kj8KI34.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '古典与现代交织的大阪有不少可看可玩的地儿。不论你是喜欢历史感厚重的古建筑还是青睐现代化的摩天大楼，也不管你是与恋人一起的甜蜜游或是全家人一起出动的亲子游，都能在这里找到自己感兴趣的地方。', 2);
INSERT INTO `city_menu` VALUES (1006, '大阪', 'https://c3-q.mafengwo.net/s8/M00/4E/35/wKgBpVXQYiyALbdLAAVaO6591W802.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://c3-q.mafengwo.net/s8/M00/4E/35/wKgBpVXQYiyALbdLAAVaO6591W802.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '京都的景点以幽静的古刹和神社为主，是集中感受日本的宗教文化的圣地。同时，京都更不乏美丽的自然风光，岚山的樱花与红枫都是人们争相前来欣赏的美景。', 2);
INSERT INTO `city_menu` VALUES (1007, '首尔', 'https://a1-q.mafengwo.net/s7/M00/E0/59/wKgB6lT136SAIe0lAA1SzXHZQJw87.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://a1-q.mafengwo.net/s7/M00/E0/59/wKgB6lT136SAIe0lAA1SzXHZQJw87.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '汉江，首尔市最重要的一条江，将首尔一分为二，分别是江南和江北两个地区。就这一隔，成就了两个地段迥然不同的城市气质和面貌。', 3);
INSERT INTO `city_menu` VALUES (1008, '济州岛', 'https://a4-q.mafengwo.net/s9/M00/95/64/wKgBs1ZLA8mAdvahAAIOXCk0Pq842.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://a4-q.mafengwo.net/s9/M00/95/64/wKgBs1ZLA8mAdvahAAIOXCk0Pq842.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '济州岛，韩国最大岛屿，位于韩国西南海域，面积1845平方公里，人口60万，岛上气候宜人，是一座著名的旅游岛，北海岸有济州市。', 3);
INSERT INTO `city_menu` VALUES (1009, '釜山', 'https://c4-q.mafengwo.net/s9/M00/8F/06/wKgBs1Y7Kd6AEEu7AAFa11J0C_k64.jpeg?imageMogr2%2Fthumbnail%2F%21375x225r%2Fgravity%2FCenter%2Fcrop%2F%21375x225%2Fquality%2F100', 'https://c4-q.mafengwo.net/s9/M00/8F/06/wKgBs1Y7Kd6AEEu7AAFa11J0C_k64.jpeg?imageMogr2%2Fthumbnail%2F%21375x225r%2Fgravity%2FCenter%2Fcrop%2F%21375x225%2Fquality%2F100', '釜山（韩语：부산，英语：Busan），全名釜山广域市，位于韩国东南端，是韩国第一大港口和第二大城市，也是世界上最繁忙的港口之一。历史上一直是东亚大陆和海洋文化交流的纽带和桥梁。', 3);
INSERT INTO `city_menu` VALUES (1010, '清迈', 'https://n3-q.mafengwo.net/s6/M00/F8/EE/wKgB4lM-MMyACutSAAiDXY7Zo-Y92.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://n3-q.mafengwo.net/s6/M00/F8/EE/wKgB4lM-MMyACutSAAiDXY7Zo-Y92.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '北方玫瑰”清迈，山清水秀景色绝 美，且人文古迹众多，深受国内外游客青睐。清迈曾长期作为泰王国的首都，至今仍保留着很多珍贵的历史和文化遗迹。城区内代表着泰北灿烂历史文化的古老寺 庙，同时，清迈的丝绸、纺织品等也著称于世，每年都有大批丝绸、纺织品出口，是泰国制造业的重要支柱。', 4);
INSERT INTO `city_menu` VALUES (1011, '曼谷', 'https://b3-q.mafengwo.net/s6/M00/11/F7/wKgB4lJoyFGABIHRAA2VXlPjpXI19.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://b3-q.mafengwo.net/s6/M00/11/F7/wKgB4lJoyFGABIHRAA2VXlPjpXI19.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '图：曼谷市区分区地图，左边为老城区，右边为新城区。', 4);
INSERT INTO `city_menu` VALUES (1012, '普吉岛', 'https://b3-q.mafengwo.net/s8/M00/3D/B0/wKgBpVU5sFKADn9ZAAU2Y9xlTRg773.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://b3-q.mafengwo.net/s8/M00/3D/B0/wKgBpVU5sFKADn9ZAAU2Y9xlTRg773.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '图：普吉岛主要海滩和景点地图。 by Hansen', 4);
INSERT INTO `city_menu` VALUES (1013, '沙巴', 'https://b4-q.mafengwo.net/s8/M00/2A/E2/wKgBpVWwUDGAH5NPACzSeKlk3Tc143.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://b4-q.mafengwo.net/s8/M00/2A/E2/wKgBpVWwUDGAH5NPACzSeKlk3Tc143.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '沙巴拥有保存得最美好的自然风光，在这里踏着细软的沙滩，投入蓝天碧海的怀抱，沿着山经深入最美的树林，探寻那些从未见过的新奇动植物……这里的一切景致都将带给你惊喜，让你惊讶于近在眼前的绝美自然奇景。山高海深的婆罗洲沙巴，是天造地设的大自然景物宝库，绝非浪得虚名。', 5);
INSERT INTO `city_menu` VALUES (1014, '仙本那', 'https://b2-q.mafengwo.net/s6/M00/38/DD/wKgB4lMNbkWAKYVIAAS7PpYjpiE27.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://b2-q.mafengwo.net/s6/M00/38/DD/wKgB4lMNbkWAKYVIAAS7PpYjpiE27.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '仙本那位于马来西亚沙巴州南部，Semporna在马来语中是“完美”之意。它曾经只是一个小小的渔村，甚至在地图上都无法找寻到它。但仙本那小镇被如绿松石般的海水包围着,它和它的附属海岛就像是一个现实世界中的梦幻之岛。白皙的沙滩、高耸的椰树、五颜六色的珊瑚礁和海水中游曳着的鱼儿始终吸引着来自全球各地的游人。更令其名扬海内的是距离仙本那港36公里外的诗巴丹（Sipadan），这里是世界首屈一指的潜水天堂。诗巴丹5米的浅滩之后就是垂直落下超过600米深的湛蓝深海，为世界五大峭壁潜水之首。世界潜水之父雅克-伊夫•库斯托称它是“未曾受过侵犯的艺术品”。除此之外，神秘的海上吉普赛——巴夭族也生活在这片净土，他们没有国籍，擅长潜水捕鱼，过着近乎原始的生活，是名副其实的大海之子。仙本那镇市场：小镇最主要的购物市场，以海鲜为主。鱼、虾、蟹应有尽有，价格实惠。很多游客都喜欢在这里购买海鲜后到店中加工美味。仙本那周边离岛：仙本那镇很小，只是作为一个中转站。主要的观光和娱乐点都在周边离岛。每个小岛均可以形容为椰林树影，水清沙幼，水下能见度极高。无论你是浮潜亦或是深潜，都能享受到无敌的海底景观。最著名的离岛是卡帕莱岛、马达京岛、马布岛、PomPom岛，前往这些小岛需要通过潜水店或度假村安排。', 5);
INSERT INTO `city_menu` VALUES (1015, '吉隆坡', 'https://a3-q.mafengwo.net/s7/M00/DD/13/wKgB6lSo-riAeZmjAAUpsCnvtvs021.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://a3-q.mafengwo.net/s7/M00/DD/13/wKgB6lSo-riAeZmjAAUpsCnvtvs021.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '吉隆坡的这10大地标景点，不仅仅打卡必去，更值得用心游览。登世界最高双塔建筑饱览璀璨夜景，去东南亚最大清真寺聆听虔诚祷告，在原最高元首宫邸感受威严气魄，都是吉隆坡独一无二的体验。', 5);
INSERT INTO `city_menu` VALUES (1016, '长洲岛', 'https://c3-q.mafengwo.net/s5/M00/43/EB/wKgB3FE1pBaAJIsmAAMyBNiZBx823.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://c3-q.mafengwo.net/s5/M00/43/EB/wKgB3FE1pBaAJIsmAAMyBNiZBx823.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '长滩岛的景点不多，以自然景观为主，最有的特点就是各种海滩了，比如最著名白沙滩、还有被称为“贝壳海滩”的普卡海滩、“冲浪圣地”布拉波海滩、清幽的丁威德海滩等。除此之外，这里还有适合观日出的卢霍山、圣母礁岩、蝙蝠洞等景观。除本岛之外，还有水晶岛和鳄鱼岛两个离岛，经常作为跳岛游的目的地。', 6);
INSERT INTO `city_menu` VALUES (1017, '杜马盖地', 'https://b4-q.mafengwo.net/s9/M00/E6/40/wKgBs1ZnnkGAcvcTAAESExVB6Kc55.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://b4-q.mafengwo.net/s9/M00/E6/40/wKgBs1ZnnkGAcvcTAAESExVB6Kc55.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '杜马盖地市内景点不多，有时间可以在市区的大学内散步。周边海岛风景优美，水清沙白。这里的水下风光更是美白不胜收，珊瑚群和各种海洋生物组成一幅色彩斑斓的画卷，让人叹为观止。', 6);
INSERT INTO `city_menu` VALUES (1018, '宿雾', 'https://c1-q.mafengwo.net/s9/M00/5A/B2/wKgBs1ZpGkWANtPGAAUxL3KA1iU16.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://c1-q.mafengwo.net/s9/M00/5A/B2/wKgBs1ZpGkWANtPGAAUxL3KA1iU16.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '宿雾（Cebu，也译成“宿务”），属于菲律宾中部的维萨亚群岛，是全国的第二大城市，由本岛及周边的一些小岛组成。而位于宿雾岛北岸的宿雾市，是首都马尼拉也比不上的历史最悠久之城。1521年，葡萄牙航海家麦哲伦由西班牙航行到中南美洲，途中惊喜地发现了这个美丽静谧的小岛。也因此宿雾成为菲律宾最早开发的城市，被誉为“菲南皇后城”。如今，在菲律宾的7000多个岛屿之中，诗情画意的宿雾岛已发展成为最受游客欢迎的观光点，着实是一处适合度假的“伊甸园”。这里的旅游业发展相当成熟，不仅拥有全世界最白的沙滩、完善的娱乐设施、一流的酒店，还有专业的潜水课程，甚至还拥有一座麦克坦-宿雾国际机场，从中国或菲律宾其他城市就能直接飞到宿雾。同时，这里也是经济高度发达的集中区，全菲律宾最为繁忙的港口就在这里。但实际上，宿雾也存在这严重的贫富差距，换句话说，这里像一个迷你版的马尼拉，在魅力四射的同时，也生活着另一部分来自社会底层的人。不过这里的人民都很虔诚，即便不富有也都活得很开心，对游客也特别友好。', 6);
INSERT INTO `city_menu` VALUES (1019, '巴厘岛', 'https://c3-q.mafengwo.net/s8/M00/02/7A/wKgBpVUk3u-AYDLxAA885W7aqSA86.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://c3-q.mafengwo.net/s8/M00/02/7A/wKgBpVUk3u-AYDLxAA885W7aqSA86.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '巴厘岛景点较多，且分布较分散，主要划分为东部、中部、南部、西部等区，景点类型以海滩、火山等自然景观为主，当然也有很多的寺庙、公园等其他景观，主要的游客聚集区都在南部。', 7);
INSERT INTO `city_menu` VALUES (1020, '民洲岛', 'https://b4-q.mafengwo.net/s7/M00/40/4A/wKgB6lTTFCmANjsoAAOgxfxbSgQ72.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://b4-q.mafengwo.net/s7/M00/40/4A/wKgB6lTTFCmANjsoAAOgxfxbSgQ72.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '民丹岛是印尼寥内群岛的最大岛屿，早在15世纪，郑和下西洋的记载中就已提及民丹岛。由于距离新加坡较近，乘搭渡轮只需45分钟，不仅新加坡人把它当作后花园，也吸引了很多到新加坡的游客和留学生。岛上有浓绿斑斓的热带植物、银色的绵长沙滩、碧蓝的大海以及各种国际级度假酒店。因为地理位置接近赤道，民丹岛终年阳光普照，年平均温在26度左右。', 7);
INSERT INTO `city_menu` VALUES (1021, '兰卡威', 'https://b3-q.mafengwo.net/s8/M00/B7/EB/wKgBpVXITziAHknZAAGGrdTZDsE24.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://b3-q.mafengwo.net/s8/M00/B7/EB/wKgBpVXITziAHknZAAGGrdTZDsE24.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '兰卡威（Pulau Langkawi），又名浮罗交怡，是马来西亚最大的一组岛屿，由99个多石灰岩岛屿组成。位于槟榔屿的北方，地理位置接近泰国，面积526平方千米，主峰王山海拔850米。兰卡威位于马来西亚半岛西北岸处，距离瓜拉玻璃市港口30公里，距离吉打港口51公里。兰卡威是东南亚最令人向往的风景胜地之一，清亮碧绿的海水和绵长平缓的沙滩构成了天堂般的海滨度假地。拥有104个热带岛屿的兰卡威，除了漂亮的自然风光, 更有着悠久的历史和传统文化, 并且还是一个处处都充满神话和传说的地方，各种稀奇古怪的妖魔、巨鹰、战士、童话公主等民间故事和神话传说流传民间。马来西亚古典文学将这座岛描述为毗湿奴的坐骑、神鸟揭路荼的休息地。关于这座岛屿有许多传奇故事，其中Mahsuri 的故事脍炙人口——被诬不贞的公主在愤然就死之前对这座岛屿发出了诅咒。为了证明她的清白，她的身体里流出了白色的鲜血，将兰卡威的沙滩染成了白色。她的陵墓就在瓜埠附近', 7);
INSERT INTO `city_menu` VALUES (1022, '巴黎', 'https://b1-q.mafengwo.net/s7/M00/A6/E4/wKgB6lSXmh2AHszjAAeY4299Bu4731.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://b1-q.mafengwo.net/s7/M00/A6/E4/wKgB6lSXmh2AHszjAAeY4299Bu4731.png?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '位于巴黎的正中心，也是古老巴黎发展的原点。巴黎圣母院和巴黎古监狱都位于面积稍大的西岱岛上，步行的话需要10分钟左右。圣路易桥将西岱岛和圣路易岛相连，小岛上虽然没有太著名的景点，但是环境安静浪漫，是散步或闲坐的好选择。', 8);
INSERT INTO `city_menu` VALUES (1023, '普罗旺斯', 'https://c4-q.mafengwo.net/s8/M00/CD/8A/wKgBpVWJOYqAHR1RABG7qNPcP6g69.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://c4-q.mafengwo.net/s8/M00/CD/8A/wKgBpVWJOYqAHR1RABG7qNPcP6g69.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '普罗旺斯，全称普罗旺斯-阿尔卑斯-蓝色海岸(Provence-Alpes-Côte d\'Azur)，是位于法国东南部的一个大区，毗邻地中海，和意大利接壤。普罗旺斯境内有艾克斯(Aix-en-Provencea)、马赛、尼斯(Nice)、阿尔勒(Arles)、阿维尼翁(Avignon)等名城。普罗旺斯是世界闻名的薰衣草故乡，大片大片的紫色花田是普罗旺斯的最佳代表；普罗旺斯还是欧洲的“骑士之城”，中世纪的重要文学体裁——骑士抒情诗即发源于此。这里物产丰饶、阳光明媚、风景优美，从古希腊、古罗马时代起就吸引着无数游人，至今依然是旅游胜地。', 8);
INSERT INTO `city_menu` VALUES (1024, '巴塞罗那', 'https://a2-q.mafengwo.net/s8/M00/98/FD/wKgBpVVfEziAQExRAAa6njShD0Y34.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', 'https://a2-q.mafengwo.net/s8/M00/98/FD/wKgBpVVfEziAQExRAAa6njShD0Y34.jpeg?imageMogr2%2Fthumbnail%2F%21150x150r%2Fgravity%2FCenter%2Fcrop%2F%21150x150%2Fquality%2F100', '一千个人心中有一千个巴塞罗那，没错，她是那样的丰富多面，无论你喜欢建筑、体育、美食还是休闲度假，这里总有让你满意的地方。在这样一个阳光明媚、悠闲惬意的城市里，小编建议大家随兴所至，当然，那些举世闻名的景点当然是不能错过的！', 8);
INSERT INTO `city_menu` VALUES (1025, '湖南', 'https://imgs-1257617444.cos.ap-chengdu.myqcloud.com/9c6ab03797.png', NULL, '好', 1);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `collect_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `discuss_id` int(32) NOT NULL AUTO_INCREMENT,
  `discuss_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discuss_value` int(32) NULL DEFAULT NULL,
  `discuss_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `order_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`discuss_id`) USING BTREE,
  INDEX `order_sn`(`order_sn`) USING BTREE,
  CONSTRAINT `fk[discuss]order_sn` FOREIGN KEY (`order_sn`) REFERENCES `order` (`order_sn`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods`  (
  `foods_id` int(32) NOT NULL AUTO_INCREMENT,
  `foods_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `foods_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityMenu_id` int(32) NULL DEFAULT NULL,
  PRIMARY KEY (`foods_id`) USING BTREE,
  INDEX `hotSpot_ibfk_1`(`cityMenu_id`) USING BTREE,
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`cityMenu_id`) REFERENCES `city_menu` (`cityMenu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3097 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (3001, '牛肉面', 'https://c2-q.mafengwo.net/s6/M00/9C/BC/wKgB4lMNs5GAAShMAAE0pvbJJvQ35.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1001);
INSERT INTO `foods` VALUES (3002, '鸡排', 'https://n2-q.mafengwo.net/s6/M00/EA/E7/wKgB4lKYShOAMLw0AAezan8SDtE41.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1001);
INSERT INTO `foods` VALUES (3003, '芋圆', 'https://n1-q.mafengwo.net/s5/M00/0F/18/wKgB3FG9NFmATM50AADxWnxh-LU40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1001);
INSERT INTO `foods` VALUES (3004, '卤肉饭', 'https://c1-q.mafengwo.net/s6/M00/48/03/wKgB4lMMfCmASAo9AAQxve-BA2k83.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1001);
INSERT INTO `foods` VALUES (3005, '云吞', 'https://c3-q.mafengwo.net/s6/M00/6E/0F/wKgB4lKwAGaAXNdhAADvGUDEmRY28.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1002);
INSERT INTO `foods` VALUES (3006, '蛋挞', 'https://b2-q.mafengwo.net/s6/M00/71/D4/wKgB4lKwBWGAYomeAAGzV-bzVNU24.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1002);
INSERT INTO `foods` VALUES (3007, '菠萝油', 'https://b2-q.mafengwo.net/s6/M00/71/78/wKgB4lKwBO6ANO-VAAErYaO661k21.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1002);
INSERT INTO `foods` VALUES (3008, '鸳鸯奶茶', 'https://b2-q.mafengwo.net/s6/M00/8A/B3/wKgB4lLaJWKAEuGiAADHFmSYGS846.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1002);
INSERT INTO `foods` VALUES (3009, '云吞', 'https://c3-q.mafengwo.net/s6/M00/6E/0F/wKgB4lKwAGaAXNdhAADvGUDEmRY28.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1003);
INSERT INTO `foods` VALUES (3010, '蛋挞', 'https://b2-q.mafengwo.net/s6/M00/71/D4/wKgB4lKwBWGAYomeAAGzV-bzVNU24.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1003);
INSERT INTO `foods` VALUES (3011, '菠萝油', 'https://b2-q.mafengwo.net/s6/M00/71/78/wKgB4lKwBO6ANO-VAAErYaO661k21.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1003);
INSERT INTO `foods` VALUES (3012, '鸳鸯奶茶', 'https://b2-q.mafengwo.net/s6/M00/8A/B3/wKgB4lLaJWKAEuGiAADHFmSYGS846.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1003);
INSERT INTO `foods` VALUES (3013, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1004);
INSERT INTO `foods` VALUES (3014, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1004);
INSERT INTO `foods` VALUES (3015, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1004);
INSERT INTO `foods` VALUES (3016, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1004);
INSERT INTO `foods` VALUES (3017, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1005);
INSERT INTO `foods` VALUES (3018, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1005);
INSERT INTO `foods` VALUES (3019, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1005);
INSERT INTO `foods` VALUES (3020, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1005);
INSERT INTO `foods` VALUES (3021, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1006);
INSERT INTO `foods` VALUES (3022, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1006);
INSERT INTO `foods` VALUES (3023, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1006);
INSERT INTO `foods` VALUES (3024, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1006);
INSERT INTO `foods` VALUES (3025, '广藏市场', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1007);
INSERT INTO `foods` VALUES (3026, '八色烤肉', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1007);
INSERT INTO `foods` VALUES (3027, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1007);
INSERT INTO `foods` VALUES (3028, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1007);
INSERT INTO `foods` VALUES (3029, '广藏市场', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1008);
INSERT INTO `foods` VALUES (3030, '八色烤肉', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1008);
INSERT INTO `foods` VALUES (3031, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1008);
INSERT INTO `foods` VALUES (3032, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1008);
INSERT INTO `foods` VALUES (3033, '广藏市场', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1009);
INSERT INTO `foods` VALUES (3034, '八色烤肉', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1009);
INSERT INTO `foods` VALUES (3035, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1009);
INSERT INTO `foods` VALUES (3036, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1009);
INSERT INTO `foods` VALUES (3037, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1010);
INSERT INTO `foods` VALUES (3038, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1010);
INSERT INTO `foods` VALUES (3039, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1010);
INSERT INTO `foods` VALUES (3040, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1010);
INSERT INTO `foods` VALUES (3041, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1011);
INSERT INTO `foods` VALUES (3042, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1011);
INSERT INTO `foods` VALUES (3043, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1011);
INSERT INTO `foods` VALUES (3044, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1011);
INSERT INTO `foods` VALUES (3045, '广藏市场', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1012);
INSERT INTO `foods` VALUES (3046, '八色烤肉', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1012);
INSERT INTO `foods` VALUES (3047, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1012);
INSERT INTO `foods` VALUES (3048, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1012);
INSERT INTO `foods` VALUES (3049, '牛肉面', 'https://c2-q.mafengwo.net/s6/M00/9C/BC/wKgB4lMNs5GAAShMAAE0pvbJJvQ35.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1013);
INSERT INTO `foods` VALUES (3050, '鸡排', 'https://n2-q.mafengwo.net/s6/M00/EA/E7/wKgB4lKYShOAMLw0AAezan8SDtE41.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1013);
INSERT INTO `foods` VALUES (3051, '芋圆', 'https://n1-q.mafengwo.net/s5/M00/0F/18/wKgB3FG9NFmATM50AADxWnxh-LU40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1013);
INSERT INTO `foods` VALUES (3052, '卤肉饭', 'https://c1-q.mafengwo.net/s6/M00/48/03/wKgB4lMMfCmASAo9AAQxve-BA2k83.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1013);
INSERT INTO `foods` VALUES (3053, '云吞', 'https://c3-q.mafengwo.net/s6/M00/6E/0F/wKgB4lKwAGaAXNdhAADvGUDEmRY28.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1014);
INSERT INTO `foods` VALUES (3054, '蛋挞', 'https://b2-q.mafengwo.net/s6/M00/71/D4/wKgB4lKwBWGAYomeAAGzV-bzVNU24.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1014);
INSERT INTO `foods` VALUES (3055, '菠萝油', 'https://b2-q.mafengwo.net/s6/M00/71/78/wKgB4lKwBO6ANO-VAAErYaO661k21.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1014);
INSERT INTO `foods` VALUES (3056, '鸳鸯奶茶', 'https://b2-q.mafengwo.net/s6/M00/8A/B3/wKgB4lLaJWKAEuGiAADHFmSYGS846.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1014);
INSERT INTO `foods` VALUES (3057, '云吞', 'https://c3-q.mafengwo.net/s6/M00/6E/0F/wKgB4lKwAGaAXNdhAADvGUDEmRY28.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1015);
INSERT INTO `foods` VALUES (3058, '蛋挞', 'https://b2-q.mafengwo.net/s6/M00/71/D4/wKgB4lKwBWGAYomeAAGzV-bzVNU24.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1015);
INSERT INTO `foods` VALUES (3059, '菠萝油', 'https://b2-q.mafengwo.net/s6/M00/71/78/wKgB4lKwBO6ANO-VAAErYaO661k21.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1015);
INSERT INTO `foods` VALUES (3060, '鸳鸯奶茶', 'https://b2-q.mafengwo.net/s6/M00/8A/B3/wKgB4lLaJWKAEuGiAADHFmSYGS846.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1015);
INSERT INTO `foods` VALUES (3061, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1016);
INSERT INTO `foods` VALUES (3062, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1016);
INSERT INTO `foods` VALUES (3063, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1016);
INSERT INTO `foods` VALUES (3064, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1016);
INSERT INTO `foods` VALUES (3065, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1017);
INSERT INTO `foods` VALUES (3066, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1017);
INSERT INTO `foods` VALUES (3067, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1017);
INSERT INTO `foods` VALUES (3068, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1017);
INSERT INTO `foods` VALUES (3069, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1018);
INSERT INTO `foods` VALUES (3070, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1018);
INSERT INTO `foods` VALUES (3071, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1018);
INSERT INTO `foods` VALUES (3072, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1018);
INSERT INTO `foods` VALUES (3073, '广藏市场', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1019);
INSERT INTO `foods` VALUES (3074, '八色烤肉', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1019);
INSERT INTO `foods` VALUES (3075, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1019);
INSERT INTO `foods` VALUES (3076, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1019);
INSERT INTO `foods` VALUES (3077, '广藏市场', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1020);
INSERT INTO `foods` VALUES (3078, '八色烤肉', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1020);
INSERT INTO `foods` VALUES (3079, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1020);
INSERT INTO `foods` VALUES (3080, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1020);
INSERT INTO `foods` VALUES (3081, '广藏市场', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1021);
INSERT INTO `foods` VALUES (3082, '八色烤肉', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1021);
INSERT INTO `foods` VALUES (3083, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1021);
INSERT INTO `foods` VALUES (3084, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1021);
INSERT INTO `foods` VALUES (3085, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1022);
INSERT INTO `foods` VALUES (3086, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1022);
INSERT INTO `foods` VALUES (3087, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1022);
INSERT INTO `foods` VALUES (3088, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1022);
INSERT INTO `foods` VALUES (3089, '海鲜，寿司', 'https://b2-q.mafengwo.net/s6/M00/F4/61/wKgB4lKPXAWAMYABAAVKnsUkNlg40.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1023);
INSERT INTO `foods` VALUES (3090, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1023);
INSERT INTO `foods` VALUES (3091, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1023);
INSERT INTO `foods` VALUES (3092, '鳗鱼', 'https://n3-q.mafengwo.net/s7/M00/9C/B9/wKgB6lSY5JSAZ2LOAAL69wo66XQ39.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1023);
INSERT INTO `foods` VALUES (3093, '广藏市场', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1024);
INSERT INTO `foods` VALUES (3094, '八色烤肉', 'https://b3-q.mafengwo.net/s7/M00/12/30/wKgB6lPjE-qAJRnPAAvFQbTdRxg29.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1024);
INSERT INTO `foods` VALUES (3095, '拉面', 'https://c1-q.mafengwo.net/s4/M00/88/45/wKgByU_WrHKovSK1AAFeogiNxg404.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1024);
INSERT INTO `foods` VALUES (3096, '甜品', 'https://n4-q.mafengwo.net/s1/M00/AF/D8/wKgBm04ZKxm9mYNtAAQxvZFdxYs47.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1024);

-- ----------------------------
-- Table structure for friend_table
-- ----------------------------
DROP TABLE IF EXISTS `friend_table`;
CREATE TABLE `friend_table`  (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) NOT NULL,
  `friend_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注昵称',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`friend_id`) USING BTREE,
  INDEX `fk[friend_table]single_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for great
-- ----------------------------
DROP TABLE IF EXISTS `great`;
CREATE TABLE `great`  (
  `great_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `server_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`great_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `server_id`(`server_id`) USING BTREE,
  CONSTRAINT `great_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `great_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `server` (`server_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of great
-- ----------------------------
INSERT INTO `great` VALUES (7, 5, '1902276ZPKR27354');

-- ----------------------------
-- Table structure for hotspot
-- ----------------------------
DROP TABLE IF EXISTS `hotspot`;
CREATE TABLE `hotspot`  (
  `hotSpot_id` int(32) NOT NULL AUTO_INCREMENT,
  `hotSpot_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hotSpot_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityMenu_id` int(32) NULL DEFAULT NULL,
  PRIMARY KEY (`hotSpot_id`) USING BTREE,
  INDEX `hotSpot_ibfk_1`(`cityMenu_id`) USING BTREE,
  CONSTRAINT `hotspot_ibfk_1` FOREIGN KEY (`cityMenu_id`) REFERENCES `city_menu` (`cityMenu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2097 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotspot
-- ----------------------------
INSERT INTO `hotspot` VALUES (2001, '101大楼', 'https://c2-q.mafengwo.net/s2/M00/CA/86/wKgBpU7O-rXx5hhlAAGZVjCO-Gg99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1001);
INSERT INTO `hotspot` VALUES (2002, '中正纪念堂', 'https://b1-q.mafengwo.net/s8/M00/31/61/wKgBpVWCxaeAVM3dAAJLYHbt2xQ64.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1001);
INSERT INTO `hotspot` VALUES (2003, '台北故宫博物馆', 'https://c2-q.mafengwo.net/s9/M00/6D/1A/wKgBs1Zhp2SATP3bAAmx1L1qhL432.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1001);
INSERT INTO `hotspot` VALUES (2004, '国父纪念馆', 'https://a3-q.mafengwo.net/s6/M00/79/07/wKgB4lN-GjaALLM8AA6Uxw5S2ro81.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1001);
INSERT INTO `hotspot` VALUES (2005, '香港迪士尼乐园', 'https://n1-q.mafengwo.net/s8/M00/34/91/wKgBpVVVvu-AOs6NAA93_jik_oE41.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1002);
INSERT INTO `hotspot` VALUES (2006, '香港海洋公园', 'https://n1-q.mafengwo.net/s6/M00/05/8D/wKgB4lKsDxSAZW-vABCSLoetlFM12.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1002);
INSERT INTO `hotspot` VALUES (2007, '南丫岛', 'https://c1-q.mafengwo.net/s6/M00/55/7E/wKgB4lKM4KeAAwSsAAODtVNqC9I44.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1002);
INSERT INTO `hotspot` VALUES (2008, '香港太平山顶', 'https://c2-q.mafengwo.net/s8/M00/34/A5/wKgBpVVVvxOAGOruAAjcXx2WXv039.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1002);
INSERT INTO `hotspot` VALUES (2009, '香港迪士尼', 'https://n1-q.mafengwo.net/s6/M00/05/8D/wKgB4lKsDxSAZW-vABCSLoetlFM12.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1003);
INSERT INTO `hotspot` VALUES (2010, '香港海洋公园', 'https://n1-q.mafengwo.net/s6/M00/05/8D/wKgB4lKsDxSAZW-vABCSLoetlFM12.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1003);
INSERT INTO `hotspot` VALUES (2011, '南丫岛', 'https://c1-q.mafengwo.net/s6/M00/55/7E/wKgB4lKM4KeAAwSsAAODtVNqC9I44.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1003);
INSERT INTO `hotspot` VALUES (2012, '香港太平山顶', 'https://c2-q.mafengwo.net/s8/M00/34/A5/wKgBpVVVvxOAGOruAAjcXx2WXv039.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1003);
INSERT INTO `hotspot` VALUES (2013, '东京塔', 'https://c2-q.mafengwo.net/s6/M00/77/3A/wKgB4lKNW4WAcYRwAASLNTjRWWg63.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1004);
INSERT INTO `hotspot` VALUES (2014, '浅草寺', 'https://b2-q.mafengwo.net/s6/M00/AD/6D/wKgB4lKNnwCACQmwAAbOfX_EbRw83.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1004);
INSERT INTO `hotspot` VALUES (2015, '皇居', 'https://c2-q.mafengwo.net/s5/M00/13/57/wKgB3FFFXpSACgJBABGq_FCSCZ001.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1004);
INSERT INTO `hotspot` VALUES (2016, '东京迪士尼乐园', 'https://n2-q.mafengwo.net/s6/M00/31/EF/wKgB4lJvIXiAYfN4AAK5qKXXOBQ13.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1004);
INSERT INTO `hotspot` VALUES (2017, '东京塔', 'https://c2-q.mafengwo.net/s6/M00/77/3A/wKgB4lKNW4WAcYRwAASLNTjRWWg63.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1005);
INSERT INTO `hotspot` VALUES (2018, '浅草寺', 'https://b2-q.mafengwo.net/s6/M00/AD/6D/wKgB4lKNnwCACQmwAAbOfX_EbRw83.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1005);
INSERT INTO `hotspot` VALUES (2019, '皇居', 'https://c2-q.mafengwo.net/s5/M00/13/57/wKgB3FFFXpSACgJBABGq_FCSCZ001.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1005);
INSERT INTO `hotspot` VALUES (2020, '东京迪士尼乐园', 'https://n2-q.mafengwo.net/s6/M00/31/EF/wKgB4lJvIXiAYfN4AAK5qKXXOBQ13.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1005);
INSERT INTO `hotspot` VALUES (2021, '东京塔', 'https://c2-q.mafengwo.net/s6/M00/77/3A/wKgB4lKNW4WAcYRwAASLNTjRWWg63.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1006);
INSERT INTO `hotspot` VALUES (2022, '浅草寺', 'https://b2-q.mafengwo.net/s6/M00/AD/6D/wKgB4lKNnwCACQmwAAbOfX_EbRw83.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1006);
INSERT INTO `hotspot` VALUES (2023, '皇居', 'https://c2-q.mafengwo.net/s5/M00/13/57/wKgB3FFFXpSACgJBABGq_FCSCZ001.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1006);
INSERT INTO `hotspot` VALUES (2024, '东京迪士尼乐园', 'https://n2-q.mafengwo.net/s6/M00/31/EF/wKgB4lJvIXiAYfN4AAK5qKXXOBQ13.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1006);
INSERT INTO `hotspot` VALUES (2025, '首尔塔', 'https://b3-q.mafengwo.net/s5/M00/A7/47/wKgB3FCbXM2AAhx3AAUDiqA3P6c79.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1007);
INSERT INTO `hotspot` VALUES (2026, '景福宫', 'https://n2-q.mafengwo.net/s6/M00/BB/AD/wKgB4lJSw1uAdFvsAAxd8vOVBTk28.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1007);
INSERT INTO `hotspot` VALUES (2027, '梨花女子大学', 'https://n4-q.mafengwo.net/s8/M00/91/CE/wKgBpVXvB7yAYfVWAAtLggpNe2o22.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1007);
INSERT INTO `hotspot` VALUES (2028, '北村韩屋村', 'https://n2-q.mafengwo.net/s7/M00/B9/B8/wKgB6lSuoiaAWRgHABXo9ROOgj090.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1007);
INSERT INTO `hotspot` VALUES (2029, '首尔塔', 'https://b3-q.mafengwo.net/s5/M00/A7/47/wKgB3FCbXM2AAhx3AAUDiqA3P6c79.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1008);
INSERT INTO `hotspot` VALUES (2030, '景福宫', 'https://n2-q.mafengwo.net/s6/M00/BB/AD/wKgB4lJSw1uAdFvsAAxd8vOVBTk28.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1008);
INSERT INTO `hotspot` VALUES (2031, '梨花女子大学', 'https://n4-q.mafengwo.net/s8/M00/91/CE/wKgBpVXvB7yAYfVWAAtLggpNe2o22.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1008);
INSERT INTO `hotspot` VALUES (2032, '北村韩屋村', 'https://n2-q.mafengwo.net/s7/M00/B9/B8/wKgB6lSuoiaAWRgHABXo9ROOgj090.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1008);
INSERT INTO `hotspot` VALUES (2033, '首尔塔', 'https://b3-q.mafengwo.net/s5/M00/A7/47/wKgB3FCbXM2AAhx3AAUDiqA3P6c79.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1009);
INSERT INTO `hotspot` VALUES (2034, '景福宫', 'https://n2-q.mafengwo.net/s6/M00/BB/AD/wKgB4lJSw1uAdFvsAAxd8vOVBTk28.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1009);
INSERT INTO `hotspot` VALUES (2035, '梨花女子大学', 'https://n4-q.mafengwo.net/s8/M00/91/CE/wKgBpVXvB7yAYfVWAAtLggpNe2o22.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1009);
INSERT INTO `hotspot` VALUES (2036, '北村韩屋村', 'https://n2-q.mafengwo.net/s7/M00/B9/B8/wKgB6lSuoiaAWRgHABXo9ROOgj090.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1009);
INSERT INTO `hotspot` VALUES (2037, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1010);
INSERT INTO `hotspot` VALUES (2038, '契迪龙寺', 'https://b3-q.mafengwo.net/s7/M00/5F/B4/wKgB6lTdqXaAD7slAAM89OKgZkw23.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1010);
INSERT INTO `hotspot` VALUES (2039, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1010);
INSERT INTO `hotspot` VALUES (2040, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1010);
INSERT INTO `hotspot` VALUES (2041, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1011);
INSERT INTO `hotspot` VALUES (2042, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1011);
INSERT INTO `hotspot` VALUES (2043, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1011);
INSERT INTO `hotspot` VALUES (2044, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1011);
INSERT INTO `hotspot` VALUES (2045, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1012);
INSERT INTO `hotspot` VALUES (2046, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1012);
INSERT INTO `hotspot` VALUES (2047, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1012);
INSERT INTO `hotspot` VALUES (2048, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1012);
INSERT INTO `hotspot` VALUES (2049, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1013);
INSERT INTO `hotspot` VALUES (2050, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1013);
INSERT INTO `hotspot` VALUES (2051, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1013);
INSERT INTO `hotspot` VALUES (2052, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1013);
INSERT INTO `hotspot` VALUES (2053, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1014);
INSERT INTO `hotspot` VALUES (2054, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1014);
INSERT INTO `hotspot` VALUES (2055, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1014);
INSERT INTO `hotspot` VALUES (2056, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1014);
INSERT INTO `hotspot` VALUES (2057, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1015);
INSERT INTO `hotspot` VALUES (2058, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1015);
INSERT INTO `hotspot` VALUES (2059, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1015);
INSERT INTO `hotspot` VALUES (2060, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1015);
INSERT INTO `hotspot` VALUES (2061, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1016);
INSERT INTO `hotspot` VALUES (2062, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1016);
INSERT INTO `hotspot` VALUES (2063, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1016);
INSERT INTO `hotspot` VALUES (2064, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1016);
INSERT INTO `hotspot` VALUES (2065, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1017);
INSERT INTO `hotspot` VALUES (2066, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1017);
INSERT INTO `hotspot` VALUES (2067, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1017);
INSERT INTO `hotspot` VALUES (2068, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1017);
INSERT INTO `hotspot` VALUES (2069, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1018);
INSERT INTO `hotspot` VALUES (2070, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1018);
INSERT INTO `hotspot` VALUES (2071, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1018);
INSERT INTO `hotspot` VALUES (2072, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1018);
INSERT INTO `hotspot` VALUES (2073, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1019);
INSERT INTO `hotspot` VALUES (2074, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1019);
INSERT INTO `hotspot` VALUES (2075, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1019);
INSERT INTO `hotspot` VALUES (2076, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1019);
INSERT INTO `hotspot` VALUES (2077, '双龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1020);
INSERT INTO `hotspot` VALUES (2078, '契迪龙寺', 'https://b1-q.mafengwo.net/s7/M00/FC/13/wKgB6lQi3ReACIJXABcAZR9GaPU36.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1020);
INSERT INTO `hotspot` VALUES (2079, '清迈古城', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1020);
INSERT INTO `hotspot` VALUES (2080, '清迈大学', 'https://b3-q.mafengwo.net/s6/M00/8B/93/wKgB4lJ1DQ-AUavCABPdU4i-EtQ99.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1020);
INSERT INTO `hotspot` VALUES (2081, '卢浮宫', 'https://n4-q.mafengwo.net/s5/M00/6D/46/wKgB3FF3eYOANmvGAAdX4li1nI044.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1021);
INSERT INTO `hotspot` VALUES (2082, '埃菲尔铁塔', 'https://p3-q.mafengwo.net/s7/M00/18/41/wKgB6lQLHE6AdxiBAB9rhtVPbgg96.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1021);
INSERT INTO `hotspot` VALUES (2083, '巴黎圣母院', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1021);
INSERT INTO `hotspot` VALUES (2084, '凯旋门', 'https://b4-q.mafengwo.net/s7/M00/FB/42/wKgB6lQVhaaAPPDMADXhkFDLM1E10.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1021);
INSERT INTO `hotspot` VALUES (2085, '卢浮宫', 'https://n4-q.mafengwo.net/s5/M00/6D/46/wKgB3FF3eYOANmvGAAdX4li1nI044.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1022);
INSERT INTO `hotspot` VALUES (2086, '埃菲尔铁塔', 'https://p3-q.mafengwo.net/s7/M00/18/41/wKgB6lQLHE6AdxiBAB9rhtVPbgg96.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1022);
INSERT INTO `hotspot` VALUES (2087, '巴黎圣母院', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1022);
INSERT INTO `hotspot` VALUES (2088, '凯旋门', 'https://b4-q.mafengwo.net/s7/M00/FB/42/wKgB6lQVhaaAPPDMADXhkFDLM1E10.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1022);
INSERT INTO `hotspot` VALUES (2089, '卢浮宫', 'https://n4-q.mafengwo.net/s5/M00/6D/46/wKgB3FF3eYOANmvGAAdX4li1nI044.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1023);
INSERT INTO `hotspot` VALUES (2090, '埃菲尔铁塔', 'https://p3-q.mafengwo.net/s7/M00/18/41/wKgB6lQLHE6AdxiBAB9rhtVPbgg96.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1023);
INSERT INTO `hotspot` VALUES (2091, '巴黎圣母院', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1023);
INSERT INTO `hotspot` VALUES (2092, '凯旋门', 'https://b4-q.mafengwo.net/s7/M00/FB/42/wKgB6lQVhaaAPPDMADXhkFDLM1E10.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1023);
INSERT INTO `hotspot` VALUES (2093, '卢浮宫', 'https://n4-q.mafengwo.net/s5/M00/6D/46/wKgB3FF3eYOANmvGAAdX4li1nI044.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1024);
INSERT INTO `hotspot` VALUES (2094, '埃菲尔铁塔', 'https://p3-q.mafengwo.net/s7/M00/18/41/wKgB6lQLHE6AdxiBAB9rhtVPbgg96.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1024);
INSERT INTO `hotspot` VALUES (2095, '巴黎圣母院', 'https://a2-q.mafengwo.net/s7/M00/7B/83/wKgB6lPdsRSAPJVzAAk7rFX8DYI87.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1024);
INSERT INTO `hotspot` VALUES (2096, '凯旋门', 'https://b4-q.mafengwo.net/s7/M00/FB/42/wKgB6lQVhaaAPPDMADXhkFDLM1E10.jpeg?imageMogr2%2Fthumbnail%2F%21280x180r%2Fgravity%2FCenter%2Fcrop%2F%21280x180%2Fquality%2F100', 1024);

-- ----------------------------
-- Table structure for messaage
-- ----------------------------
DROP TABLE IF EXISTS `messaage`;
CREATE TABLE `messaage`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_messages` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `status` bit(1) NOT NULL COMMENT '接收状态',
  `from_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发送者id',
  `to_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接受者id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `buyer_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家电话',
  `buyer_count` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买数量',
  `order_amount` decimal(8, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `buyer_talk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言',
  `buyer_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家名字',
  `order_sn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `server_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务编号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户外键',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `order_sn`(`order_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (8, '18796255910', '2', 2.00, '舒适', '陈昕', '190301H4T7PHM2RP', '2019-03-01 22:39:38', NULL, '190301GH3KA4363C', 2);
INSERT INTO `order` VALUES (9, '18799961321', '2', 2.00, '', '陈昕', '190301H5PA89C5WH', '2019-03-01 22:42:19', NULL, '190301GH3KA4363C', 2);
INSERT INTO `order` VALUES (10, '大撒法', '2', 2.00, '', '大撒法', '190301H6SPXGCY3C', '2019-03-01 22:45:34', NULL, '190301GH3KA4363C', 2);
INSERT INTO `order` VALUES (11, '18796255910', '1', 5.00, '玩就完事了', '陈昕', '190301H9FGNZB5S8', '2019-03-01 22:53:42', NULL, '190301H9842CPTTC', 2);
INSERT INTO `order` VALUES (12, '18796255910', '1', 200.00, '', '陈昕', '190301HA8ZX35S80', '2019-03-01 22:56:07', NULL, '1902267SNA42YMCH', 2);
INSERT INTO `order` VALUES (13, '531312', '1', 5.00, '', '士大夫', '190301HBGB6YSGF8', '2019-03-01 22:59:48', NULL, '190301H9842CPTTC', 2);
INSERT INTO `order` VALUES (14, '121345', '1', 200.00, '', '大撒法', '190301HBWSX36PBC', '2019-03-01 23:00:49', NULL, '1902267SNA42YMCH', 2);
INSERT INTO `order` VALUES (15, '大撒法', '1', 5.00, '', '士大夫', '190301HF425B1Z54', '2019-03-01 23:07:36', NULL, '190301H9842CPTTC', 2);
INSERT INTO `order` VALUES (16, '12312', '1', 5.00, '', '大撒法', '190301HGGN18FNC0', '2019-03-01 23:11:50', NULL, '190301H9842CPTTC', 2);
INSERT INTO `order` VALUES (17, '士大夫', '1', 5.00, '', '地方撒', '190301HM1M10NCM8', '2019-03-01 23:19:20', NULL, '190301H9842CPTTC', 2);
INSERT INTO `order` VALUES (25, '阿斯蒂', '2', 8.00, '', '大撒法', '1903027MP914ZSCH', '2019-03-02 10:44:43', NULL, '19030275KPT8FS14', 2);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keepActive` tinyint(1) NULL DEFAULT NULL,
  `requireAuth` tinyint(1) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`permission_id`) USING BTREE,
  INDEX `sdfs`(`parent_id`) USING BTREE,
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `permission` (`permission_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place`  (
  `place_id` int(32) NOT NULL AUTO_INCREMENT,
  `place_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `place_img` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityMenu_id` int(32) NULL DEFAULT NULL,
  `place_tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`place_id`) USING BTREE,
  INDEX `hotSpot_ibfk_1`(`cityMenu_id`) USING BTREE,
  CONSTRAINT `place_ibfk_1` FOREIGN KEY (`cityMenu_id`) REFERENCES `city_menu` (`cityMenu_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4073 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of place
-- ----------------------------
INSERT INTO `place` VALUES (4001, '台北夜市觅食攻略', 'http://img.chufaba.me/routes/2016/06/16/rqqxvwc3n31n7g8d.jpg!960x480', 1001, '“饱”岛台湾的夜晚');
INSERT INTO `place` VALUES (4002, '精挑细选住花莲', 'http://img.chufaba.me/routes/2016/08/25/0y49vwpc7gmalts7.jpg!960x480', 1001, '圆一个向往独栋，住小洋房的梦');
INSERT INTO `place` VALUES (4003, '来到垦丁要这样玩', 'http://img.chufaba.me/routes/2016/06/16/rqqxvwc3n31n7g8d.jpg!960x480', 1001, '台湾夏威夷攻略');
INSERT INTO `place` VALUES (4004, '台北夜市觅食攻略', 'http://img.chufaba.me/routes/2016/06/16/rqqxvwc3n31n7g8d.jpg!960x480', 1002, '“饱”岛台湾的夜晚');
INSERT INTO `place` VALUES (4005, '精挑细选住花莲', 'http://img.chufaba.me/routes/2016/08/25/0y49vwpc7gmalts7.jpg!960x480', 1002, '圆一个向往独栋，住小洋房的梦');
INSERT INTO `place` VALUES (4006, '来到垦丁要这样玩', 'http://img.chufaba.me/routes/2016/06/16/rqqxvwc3n31n7g8d.jpg!960x480', 1002, '台湾夏威夷攻略');
INSERT INTO `place` VALUES (4007, '台北夜市觅食攻略', 'http://img.chufaba.me/routes/2016/06/16/rqqxvwc3n31n7g8d.jpg!960x480', 1003, '“饱”岛台湾的夜晚');
INSERT INTO `place` VALUES (4008, '精挑细选住花莲', 'http://img.chufaba.me/routes/2016/08/25/0y49vwpc7gmalts7.jpg!960x480', 1003, '圆一个向往独栋，住小洋房的梦');
INSERT INTO `place` VALUES (4009, '来到垦丁要这样玩', 'http://img.chufaba.me/routes/2016/06/16/rqqxvwc3n31n7g8d.jpg!960x480', 1003, '台湾夏威夷攻略');
INSERT INTO `place` VALUES (4010, '繁华满目夜未央', 'http://img.chufaba.me/routes/2015/01/31/138b98a90e56a830.jpg!960x480', 1004, '东京最佳夜景观赏地');
INSERT INTO `place` VALUES (4011, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1004, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4012, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1004, '北海道温泉指南');
INSERT INTO `place` VALUES (4013, '繁华满目夜未央', 'http://img.chufaba.me/routes/2015/01/31/138b98a90e56a830.jpg!960x480', 1005, '东京最佳夜景观赏地');
INSERT INTO `place` VALUES (4014, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1005, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4015, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1005, '北海道温泉指南');
INSERT INTO `place` VALUES (4016, '繁华满目夜未央', 'http://img.chufaba.me/routes/2015/01/31/138b98a90e56a830.jpg!960x480', 1006, '东京最佳夜景观赏地');
INSERT INTO `place` VALUES (4017, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1006, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4018, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1006, '北海道温泉指南');
INSERT INTO `place` VALUES (4019, '海的味道，济州知道', 'http://img.chufaba.me/routes/2016/04/13/e8ekiarvrhhrxhqi.jpg!960x480', 1007, '济州岛极致观景地');
INSERT INTO `place` VALUES (4020, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1007, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4021, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1007, '北海道温泉指南');
INSERT INTO `place` VALUES (4022, '海的味道，济州知道', 'http://img.chufaba.me/routes/2016/04/13/e8ekiarvrhhrxhqi.jpg!960x480', 1008, '济州岛极致观景地');
INSERT INTO `place` VALUES (4023, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1008, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4024, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1008, '北海道温泉指南');
INSERT INTO `place` VALUES (4025, '海的味道，济州知道', 'http://img.chufaba.me/routes/2016/04/13/e8ekiarvrhhrxhqi.jpg!960x480', 1009, '济州岛极致观景地');
INSERT INTO `place` VALUES (4026, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1009, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4027, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1009, '北海道温泉指南');
INSERT INTO `place` VALUES (4028, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1010, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4029, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1010, '清迈集市搜罗');
INSERT INTO `place` VALUES (4030, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1010, '普吉选岛攻略');
INSERT INTO `place` VALUES (4031, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1011, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4032, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1011, '清迈集市搜罗');
INSERT INTO `place` VALUES (4033, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1011, '普吉选岛攻略');
INSERT INTO `place` VALUES (4034, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1012, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4035, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1012, '清迈集市搜罗');
INSERT INTO `place` VALUES (4036, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1012, '普吉选岛攻略');
INSERT INTO `place` VALUES (4037, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1013, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4038, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1013, '清迈集市搜罗');
INSERT INTO `place` VALUES (4039, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1013, '普吉选岛攻略');
INSERT INTO `place` VALUES (4040, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1014, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4041, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1014, '清迈集市搜罗');
INSERT INTO `place` VALUES (4042, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1014, '普吉选岛攻略');
INSERT INTO `place` VALUES (4043, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1015, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4044, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1015, '清迈集市搜罗');
INSERT INTO `place` VALUES (4045, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1015, '普吉选岛攻略');
INSERT INTO `place` VALUES (4046, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1016, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4047, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1016, '清迈集市搜罗');
INSERT INTO `place` VALUES (4048, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1016, '普吉选岛攻略');
INSERT INTO `place` VALUES (4049, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1017, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4050, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1017, '清迈集市搜罗');
INSERT INTO `place` VALUES (4051, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1017, '普吉选岛攻略');
INSERT INTO `place` VALUES (4052, '普吉高逼格SPA推荐', 'http://img.chufaba.me/routes/2016/06/13/5n4s0ct0doczx0sp.jpg!960x480', 1018, '面朝大海 让身体呼吸');
INSERT INTO `place` VALUES (4053, '出尘之城的俗世美', 'http://img.chufaba.me/routes/2014/10/28/cb20920e7000fd3a.jpg!960x480', 1018, '清迈集市搜罗');
INSERT INTO `place` VALUES (4054, '众里寻“岛”千百度', 'http://img.chufaba.me/routes/2016/04/07/am1cxx6lkvsdnojd.jpg!960x480', 1018, '普吉选岛攻略');
INSERT INTO `place` VALUES (4055, '台北夜市觅食攻略', 'http://img.chufaba.me/routes/2016/06/16/rqqxvwc3n31n7g8d.jpg!960x480', 1019, '“饱”岛台湾的夜晚');
INSERT INTO `place` VALUES (4056, '精挑细选住花莲', 'http://img.chufaba.me/routes/2016/08/25/0y49vwpc7gmalts7.jpg!960x480', 1019, '圆一个向往独栋，住小洋房的梦');
INSERT INTO `place` VALUES (4057, '来到垦丁要这样玩', 'http://img.chufaba.me/routes/2016/06/16/rqqxvwc3n31n7g8d.jpg!960x480', 1019, '台湾夏威夷攻略');
INSERT INTO `place` VALUES (4058, '繁华满目夜未央', 'http://img.chufaba.me/routes/2015/01/31/138b98a90e56a830.jpg!960x480', 1020, '东京最佳夜景观赏地');
INSERT INTO `place` VALUES (4059, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1020, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4060, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1020, '北海道温泉指南');
INSERT INTO `place` VALUES (4061, '繁华满目夜未央', 'http://img.chufaba.me/routes/2015/01/31/138b98a90e56a830.jpg!960x480', 1021, '东京最佳夜景观赏地');
INSERT INTO `place` VALUES (4062, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1021, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4063, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1021, '北海道温泉指南');
INSERT INTO `place` VALUES (4064, '繁华满目夜未央', 'http://img.chufaba.me/routes/2015/01/31/138b98a90e56a830.jpg!960x480', 1022, '东京最佳夜景观赏地');
INSERT INTO `place` VALUES (4065, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1022, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4066, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1022, '北海道温泉指南');
INSERT INTO `place` VALUES (4067, '海的味道，济州知道', 'http://img.chufaba.me/routes/2016/04/13/e8ekiarvrhhrxhqi.jpg!960x480', 1023, '济州岛极致观景地');
INSERT INTO `place` VALUES (4068, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1023, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4069, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1023, '北海道温泉指南');
INSERT INTO `place` VALUES (4070, '海的味道，济州知道', 'http://img.chufaba.me/routes/2016/04/13/e8ekiarvrhhrxhqi.jpg!960x480', 1024, '济州岛极致观景地');
INSERT INTO `place` VALUES (4071, '心满意足的“败”在高雄', 'http://img.chufaba.me/routes/2016/08/18/3o589qptcfly38ew.jpg!960x480', 1024, '高雄扫货停不下来');
INSERT INTO `place` VALUES (4072, '雪国风吕', 'http://img.chufaba.me/routes/2015/01/29/cf0689bc0d049e10.jpg!960x480', 1024, '北海道温泉指南');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `province_id` int(32) NOT NULL,
  `province_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份',
  `server_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`province_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(32) NOT NULL,
  `role_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色英文',
  `role_nameZH` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色中文',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_ADMIN', '管理员');
INSERT INTO `role` VALUES (2, 'ROLE_USER', '用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `fs`(`permission_id`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for server
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server`  (
  `server_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `server_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `server_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '服务价格',
  `server_description` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `server_icon` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图',
  `server_status` tinyint(3) NULL DEFAULT 0 COMMENT '服务状态,0正常1下架',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `server_place` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `server_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户外键',
  PRIMARY KEY (`server_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `server_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of server
-- ----------------------------
INSERT INTO `server` VALUES ('19030275DB9F586W', '大撒法', 4.00, '大撒法', NULL, 0, '2019-03-02 10:04:56', '2019-03-02 10:04:56', '徐州市', '的撒的撒', 2);
INSERT INTO `server` VALUES ('19030275KPT8FS14', '撒发生大', 4.00, '倒萨范德萨', NULL, 0, '2019-03-02 10:05:24', '2019-03-02 10:05:24', '徐州市', '大撒法 是', 2);
INSERT INTO `server` VALUES ('1903027MP8Z2ZPDP', NULL, NULL, NULL, NULL, 1, '2019-03-02 10:44:42', '2019-03-02 10:44:42', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share`  (
  `share_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(32) NOT NULL,
  `share_content` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享内容',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`share_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `user_nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_bg` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户壁纸',
  `user_icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `user_sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别',
  `user_area` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户地区',
  `user_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户描述',
  `follow_count` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关注',
  `share_count` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粉丝',
  `fans_count` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享',
  `user_status` tinyint(1) NOT NULL COMMENT '是否禁用',
  `user_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的token',
  `user_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信验证',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `idx_single_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '13439496682', '13439496682', '$2a$10$T5Dn2/zlv.A/VEB/eETwN.tQoZ3wrJ2FGMaq3FtTKzxK/SQi63AV2', NULL, '爱你会上瘾', NULL, NULL, '男', '北京市 北京市 东城区', '过的挺好', '3', '4', '1', 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMzQzOTQ5NjY4MiIsImV4cCI6MTU0OTc3MzUzOCwiaWF0IjoxNTQ5MTY4NzM4fQ.8J8CWAsWC_MMaFmy98K94I937ZnluG1dwjEiu9PGMl6A1p8uk4aDRP5QWPuniWQghi4OoigGAVydZzf-xnrTxA', '', '2019-02-03 12:38:14');
INSERT INTO `user` VALUES (2, '18796255910', '18796255910', '$2a$10$9Ki0O9Xfk3LIFqCe5dHyyenS5pdDhfmtcV3ZCfYekGs1lB42Xn6vW', NULL, '美女一枚', '/2/Bg/server1.jpg', '/2/Icon/touxiang5.jpg', '女', '北京市 北京市 朝阳区', NULL, NULL, NULL, NULL, 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxODc5NjI1NTkxMCIsImV4cCI6MTU1MDQ4NTk4NiwiaWF0IjoxNTQ5ODgxMTg2fQ.WISb3aiJlJ-D-5-LP1IJqJWWduGUBd-sFjrkgKubI47TvPADXxeWEJnYTC1RDgNGSxXMvkm0pRQXSCjuQqnIEA', '', '2019-02-11 18:32:12');
INSERT INTO `user` VALUES (3, '13718754145', '13718754145', '$2a$10$SsoIKzAFgedY/eQidZizr.zN.VKW7V5udUxinFysC5jCUp3gp2AnW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '', '2019-02-22 14:50:47');
INSERT INTO `user` VALUES (4, '15152103389', '15152103389', '$2a$10$bDNxKtgflcgjlFq53dWblOIA1y8WmSA2IMmcNeGsybZhrClnJ6IDC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTE1MjEwMzM4OSIsImV4cCI6MTU1MTY2MjMwMCwiaWF0IjoxNTUxMDU3NTAwfQ.6Y66JXD6WtJT1T2UmPpYMuixlrFIBiZHqc5wu3zOtlm-ai1bRUJfi-mwV7ngbGXOZhfCOaHg2aKYq3Q4frEVWA', '', '2019-02-25 09:16:32');
INSERT INTO `user` VALUES (5, '15673733303', '15673733303', '$2a$10$uQqhq1X0NjZwurww.sFNve9x4ZCts3TAKgxwNJt4pxSIHjXcC4S.G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNTY3MzczMzMwMyIsImV4cCI6MTU1MTY2MzI4NCwiaWF0IjoxNTUxMDU4NDg0fQ.Uq8pRs0KYwiKASlqz33lWJyOKaifj2tRhDfGRVaDNuyh5mKY9X70j6V0Q4YKjOHYcxt4yjdNG1XZBEWGdavHFg', '', '2019-02-25 09:34:22');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `role_id` int(32) NOT NULL,
  `user_id` int(32) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `fk[user_role]role_id`(`role_id`) USING BTREE,
  INDEX `fk[user_role]user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk[user_role]role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk[user_role]user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
