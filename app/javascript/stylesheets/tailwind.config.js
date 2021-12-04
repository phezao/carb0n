module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/*.rb',
    './app/javascript/**/*.js',
    './app/javascript/**/*.vue'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      borderRadius: {
        'primary': '1.875rem',
      },
      fontFamily: {
        'poppins': ['Poppins', 'sans-serif']
      },
      colors: {
        'primary': '#1B69E4',
        'primary-hover': '#004FB3',
        'accent': '#CADBF7',
        'neutral': '#001D47',
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
