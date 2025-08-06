func numOfUnplacedFruits(fruits []int, baskets []int) int {
	num_of_baskets := len(baskets)
	sqrt_num_of_baskets := int(math.Sqrt(float64(num_of_baskets)))
	num_of_sections := (num_of_baskets + sqrt_num_of_baskets - 1) / sqrt_num_of_baskets
	max_values_of_sections := make([]int, num_of_sections)

	for i, basket_cap := range baskets {
		section := i / sqrt_num_of_baskets
		max_values_of_sections[section] = max(max_values_of_sections[section], basket_cap)
	}

	unplaced := 0

	for _, num_of_fruits := range fruits {
		is_fruit_basket_found := false

		for sec, max_section_value := range max_values_of_sections {
			if max_section_value < num_of_fruits {
				continue
			}

			start_of_section := sec * sqrt_num_of_baskets
			end_of_section := start_of_section + sqrt_num_of_baskets

			for section_values_iterator := start_of_section; section_values_iterator < end_of_section && section_values_iterator < len(baskets); section_values_iterator++ {
				if baskets[section_values_iterator] >= num_of_fruits {
					baskets[section_values_iterator] = 0
					is_fruit_basket_found = true

					// Recompute section max
					max_in_section := 0
					for k := start_of_section; k < end_of_section && k < len(baskets); k++ {
						max_in_section = max(max_in_section, baskets[k])
					}
					max_values_of_sections[sec] = max_in_section
					break
				}
			}

			if is_fruit_basket_found {
				break
			}
		}

		if !is_fruit_basket_found {
			unplaced++
		}
	}

	return unplaced
}