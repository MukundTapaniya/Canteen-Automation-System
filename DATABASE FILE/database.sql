SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `code_camp_bd_fos`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(1, 'mukund', '4367c5fe5549ef7e24b83d1d11fb6d0f', 'admin@gmail.com', '', '2023-02-22 07:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int NOT NULL,
  `rs_id` int NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(1, 1, 'Dhokla', 'Steamed savory cake made from fermented rice and chickpea batter.', '8.00', '62908867a48e4.jpg'),
(2, 1, 'Handvo', 'A savory cake made with mixed lentils and vegetables, baked to perfection.', '10.00', '62908867a48e4.jpg'),
(3, 2, 'Butter Chicken', 'Tender chicken pieces cooked in a creamy tomato sauce.', '15.00', '629089fee52b9.jpg'),
(4, 2, 'Palak Paneer', 'Spinach curry with soft paneer cubes, a classic North Indian dish.', '12.00', '629089fee52b9.jpg'),
(5, 3, 'Idli', 'Soft, fluffy steamed rice cakes served with sambar and chutney.', '6.00', '62908bdf2f581.jpg'),
(6, 3, 'Dosa', 'Crispy rice and lentil crepes served with chutney and sambar.', '8.00', '62908bdf2f581.jpg'),
(7, 4, 'Fried Rice', 'Flavorful rice stir-fried with vegetables and spices.', '10.00', '62908bdf2f581.jpg'),
(8, 4, 'Chow Mein', 'Stir-fried noodles with vegetables and a choice of protein.', '12.00', '62908bdf2f581.jpg'),
(9, 5, 'Biryani', 'Aromatic basmati rice layered with marinated chicken or vegetables.', '18.00', '62908d393465b.jpg'),
(10, 5, 'Paneer Tikka', 'Marinated paneer cubes grilled to perfection, served with mint chutney.', '14.00', '62908d393465b.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `id` int NOT NULL,
  `frm_id` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int NOT NULL,
  `c_id` int NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(1, 1, 'Gujarati Thali', 'gujarati@example.com', '3547854700', 'www.gujarathali.com', '11am', '10pm', 'Mon-Sun', 'Gujarat Street, Mumbai', '6290877b473ce.jpg', '2023-09-22 08:10:35'),
(2, 2, 'Punjabi Dhaba', 'punjabi@example.com', '0557426406', 'www.punjabidhaba.com', '10am', '11pm', 'Mon-Sun', 'Punjab Avenue, Delhi', '606d720b5fc71.jpg', '2023-09-22 08:06:41'),
(3, 3, 'South Indian Spice', 'southindian@example.com', '1458745855', 'www.southspice.com', '9am', '9pm', 'Mon-Sun', 'Chennai Road, Bangalore', '6290860e72d1e.jpg', '2023-09-22 08:04:30'),
(4, 4, 'Chinese Wok', 'chinese@example.com', '6545687458', 'www.chinesewok.com', '12pm', '11pm', 'Mon-Sun', 'China Town, Kolkata', '6290af6f81887.jpg', '2023-09-22 11:01:03'),
(5, 5, 'North Indian Flavors', 'northindian@example.com', '1234567890', 'www.northindianflavors.com', '10am', '10pm', 'Mon-Sun', 'Delhi Highway, Jaipur', '6290af6f81887.jpg', '2023-09-22 11:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(1, 'Gujarati', '2023-09-22 08:07:35'),
(2, 'Punjabi', '2023-09-22 08:07:35'),
(3, 'South Indian', '2023-09-22 08:07:35'),
(4, 'Chinese', '2023-09-22 08:07:35'),
(5, 'North Indian', '2023-09-22 08:07:35');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int NOT NULL,
  `u_id` int NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

COMMIT;
